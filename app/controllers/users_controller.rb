class UsersController < ApplicationController
  before_action :find_user, only: %i[edit]
  before_action :find_user_by_role, only: %i[role_assign remove_role]
  before_action :authorize_request, except: %i[create]

  def role_assign
    @user.roles << @role
    if @user.save
      render json: @user, status:200
    else
      render json: @user.errors
    end
  end

  def remove_role
    @user.roles.delete(@role)
    if @user.save
      render json: @user, status:200
    else
      render json: @user.errors
    end
  end

  def index 
    @users = User.active.all
    if @users
      render json: @users, status:200
    else
      render json: @users.errors
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user 
    else
      render json: @user.errors
    end
  end

  def deactive
    @user = User.find(params[:id])
    if @user.update(status: 'deactive')
      render json: {status: "User deactivated"}
    else
      render json: @user.errors
    end
  end

  
  def edit
    if @user.update(user_params)
      render json: @user, status:200
    else
      render json: @user.errors
    end
  end

  
  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, status:200
    else
      render json: @user.errors
    end
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destroy
        render json: {status: "User deleted successfully"}
    else
        render json: @user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :username, :password)
  end


  def find_user
    @user = User.find(params[:id])
  end

  # def update_params
  #   params.require(:user).permit(:full_name, :email, :username, :password_digest, :role_name)
  # end

  def find_user_by_role
    @user = User.find_by(id: params[:user_id])
    @role = Role.find_by(id: params[:role_id])
  end
  
end
