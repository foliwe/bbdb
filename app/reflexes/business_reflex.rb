class BusinessReflex < ApplicationReflex
  def like
    business = Business.find(element.dataset[:id])
    #post.likes.find_or_create_by(user: current_user)
    #console.log(business)
  end
end