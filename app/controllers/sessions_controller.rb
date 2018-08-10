class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path
  end
  def new
    @user = User.new
  end

  def create
    u = User.find_by(email: params[:user][:email])

    if u.present?
      if u.password == params[:password]
        session[:user_id] = u.id
        redirect_to histories_path
      else
        redirect_to users_sign_in_path, alert: 'Clave incorrecta'
      end
    else
      redirect_to users_sign_in_path, alert: 'Email incorrecto'
    end
  end
end
