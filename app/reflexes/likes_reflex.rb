class LikesReflex < ApplicationReflex
  def create
    likeable = GlobalID::Locator.locate_signed(element.dataset[:sgid])
    likeable.likes.find_or_create_by(user: current_user)
  end