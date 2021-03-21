class LikesReflex < ApplicationReflex
  def like
    business = Business.find(element.dataset[:id])
    business.likes.find_or_create_by(user: current_user)
  end
  end