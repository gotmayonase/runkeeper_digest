class Activity < ActiveRecord::Base
  
  belongs_to :user
  
  scope :for_type, ->(type) { where(:activity_type => type) }
  scope :summarized_for_user, ->(user) {
    select('activity_type, sum(total_distance) as total_distance, sum(duration) as total_duration, sum(total_calories) as total_calories').
    group('activity_type').
    where(:user_id => user.id)
  }
  
  def self.import_for_user(user)
    rk_user = Runkeeper.new(user.token)
    options = {}
    options[:headers] = { 'If-Modified-Since' => user.last_import_attempt.utc.strftime('%a, %e %b %Y %H:%M:%S GMT')} if user.last_import_attempt
    options[:query] = { :noEarlierThan => (user.last_activity_date - 1).strftime('%Y-%m-%d') } if user.last_activity_date
    rk_activities = rk_user.fitness_activities(options)
    rk_activities.each do |rk_activity|
      unless user.activities.find_by_uri(rk_activity[:uri])
        user.activities.create(
          :activity_type => rk_activity[:type],
          :start_time => rk_activity[:start_time],
          :total_distance => rk_activity[:total_distance],
          :duration => rk_activity[:duration],
          :total_calories => rk_activity[:total_calories],
          :uri => rk_activity[:uri]
        )
      end
    end
    user.last_import_attempt = Time.now
    user.save
  end
  
end
