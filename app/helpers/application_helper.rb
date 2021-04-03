module ApplicationHelper

  def business_logo(business_id)
    business = Business.find(business_id)
    if user.logo.attached?
        image_tag user.logo
    else
        image_tag 'default.png'
    end
end
end
