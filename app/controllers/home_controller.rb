class HomeController < ApplicationController

  def index
    if current_user
      redirect_to businesses_path
    end
  end

  def help
    
  end

  def general

  end

  def bill
    
  end

  def assistance

  end

  def deals
    
  end

  def devices
    
  end

  def events
    
  end
end
