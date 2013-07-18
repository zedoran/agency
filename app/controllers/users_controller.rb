# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page], :per_page => 1)
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Добро пожаловать к нам! #{@user.name}"
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Ваш профиль успешно обновлен"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь успешно удален."
    redirect_to users_url
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Пожалуйста, войдите или зарегистрируйтесь, если вы новый пользователь"
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(home_path) unless current_user?(@user)
    end
    def admin_user
      redirect_to(home_path) unless current_user.admin?
    end
end
