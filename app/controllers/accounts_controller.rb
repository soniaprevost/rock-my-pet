class AccountsController < ApplicationController
  def show
  end

  def edit
  end

  def update
    current_user.update(account_params)
    redirect_to account_path
  end

  private

  def account_params
    params.require(:user).permit(:name)
  end
end