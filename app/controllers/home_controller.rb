class HomeController < ApplicationController
  def index
    if current_user
      redirect_to businesses_path
    end
  end
  def help
  end
end
