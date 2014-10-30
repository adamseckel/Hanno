class Users::OmniauthCallbacksController < ApplicationController


  def github
    oauth_data = request.env["omniauth.auth"].to_hash
    user       = User.find_or_create_from_github(oauth_data)
    if user
      sign_in user
      redirect_to root_path, notice: "Sign In Successfully!"
    else
      redirect_to root_path, alert: "Sorry! couldn't sign you in"
    end
  end


end
