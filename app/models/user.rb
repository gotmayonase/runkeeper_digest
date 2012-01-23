class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :athlete_type, :birthday, :gender, :goal, :location, :runkeeper_id, :name, :medium_picture, :normal_picture, :nickname, :token
  
  has_many :activities
  
  def self.find_for_runkeeper_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:runkeeper_id => data.userID).first
      user
    else # Create a user with a stub password. 
      User.create!(
        :nickname => access_token.info.nickname,
        :token => access_token.credentials.token,
        :password => Devise.friendly_token[0,20],
        :athlete_type => data.athlete_type,
        :birthday => data.birthday,
        :gender => data.gender,
        :goal => data.goal,
        :location => data.location,
        :runkeeper_id => data.userID,
        :name => data.name,
        :medium_picture => data.medium_picture,
        :normal_picture => data.normal_picture
      ) 
    end
  end
  
  def last_activity_date
    activity = activities.order('start_time desc').first
    activity && activity.start_time.to_date
  end
  
end
