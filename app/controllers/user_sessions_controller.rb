class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Ingreso exitoso!"
      redirect_to projects_url
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = "Salida exitosa!"
    redirect_to root_url
  end

end
