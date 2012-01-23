class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def runkeeper
    debugger
    # You need to implement the method below in your model
    @user = User.find_for_runkeeper_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Runkeeper"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.runkeeper_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
end