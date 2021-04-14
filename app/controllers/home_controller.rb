class HomeController < ApplicationController
  def index
    if current_user
      redirect_to businesses_path
    end
    ActionCable.server.broadcast('notification_channel', 'Welcome to the Black Business Database.')
  end
  def help
  end
end
