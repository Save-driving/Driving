class SessionsController < ApplicationController
  def new
  end

  def create
  	user = login(params[:username], params[:password], params[:remember_me])
    if user
    	redirect_back_or_to gruas_path
    else
    	flash.now.alert = "El email o el  password es incorrecto"
    	render :new
    end
  end

  def destroy
  	logout
    redirect_to root_path
  end
end
