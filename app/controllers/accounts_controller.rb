class AccountsController < ApplicationController
  def show
    @user = current_user
    @pets = current_user.pets.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(account_params)

    redirect_to account_path
  end

  private

  def account_params
    params.require(:user).permit(:name)
  end
end