class User::SessionsController < Devise::SessionsController

  def new

    @news = History.find(History.pluck(:id).sample)
    super
  end

  
end