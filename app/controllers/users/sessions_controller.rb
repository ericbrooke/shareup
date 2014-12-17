class Users::SessionsController < Devise::SessionsController

  skip_before_action :verify_authenticity_token

  before_action :authernticate_user!, except: [:create]
  respond_to :json

  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return failure unless resource
    return failure unless resource.valid_password?(params[:user][:password])

    render status: 200,
    json: {
      success: true,
      info: "Logged in",
      data: {
        auth_token: current_user.authenticate_token
      }
    }
  end

  def failure
    warden.custom_failure!
    render status: 200,
    json: {
      success: false,
      info: "Login failed",
      date: {}
    }
  end

end
