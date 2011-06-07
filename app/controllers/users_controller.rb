class UsersController < ApplicationController
  load_and_authorize_resource
  
  def new
    # @user = User.new
  end

  def create
    # @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Registro exitoso."
    else
      render :action => 'new'
    end
  end

  def edit
    # @user = current_user
  end

  def update
    # @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end
end
