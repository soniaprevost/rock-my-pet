class HomeController < ApplicationController
   # TODO skip authentications
  skip_before_action :authenticate_user!

  def index
  end

  def about
  end
end
