class ReviewsController < ApplicationController
    def create
        @business = Business.find(params[:business_id])
        @review = @business.reviews.create(review_params)
        redirect_to business_path(@business)
      end
    
      private
        def review_params
          params.require(:review).permit(:comment)
          #comment, email would be added if we had emails
        end
    end
