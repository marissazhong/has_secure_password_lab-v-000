class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:user]
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to controller: 'welcome', action: 'home'
        else
          redirect_to controller: 'sessions', action: 'new'
        end
    end
  end

  def destroy
    session.delete :name
    redirect_to controller: 'application', action: 'hello'
  end

end
