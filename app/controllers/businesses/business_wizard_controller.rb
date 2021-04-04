class Businesses::BusinessWizardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business, only: [:show, :update, :finish_wizard_path]
  include Wicked::Wizard

  steps :basic_info, :company_info, :logo, :banner, :category #, :address


  def show
      authorize @business, :edit?
    case step
      when :basic_info
      when :company_info
      when :logo 
      when :banner 
      when :category
    end
      if wizard_steps.any? && wizard_steps.index(step).present?
          @progress = ((wizard_steps.index(step) + 1) * 100) / wizard_steps.count
        else 
          @progress = 0
      end
    
        render_wizard 
  end

  def update
    authorize @business, :edit?
    if wizard_steps.any? && wizard_steps.index(step).present?
        @progress = ((wizard_steps.index(step) + 1) * 100) / wizard_steps.count
      else 
        @progress = 0
    end

    case step 
      when :basic_info
        @business.update(business_params)
      when :company_info
        @business.update(business_params)
      when :logo
        @business.update(business_params)
      when :banner
        @business.update(business_params)
      when :category
        @business.update(business_params)
      # when :address
      #   @business.update(business_params)
    end
    render_wizard @business
  end

  def finish_wizard_path
    authorize @business, :edit?
    business_path(@business)
  end

  private
  def set_business
    @business = Business.friendly.find(params[:business_id])
  end


  def business_params
    params.require(:business).permit(
                  :description, 
                  :business_name,
                  :business_email,
                  :number_of_employee,
                  :accepts_partnership,
                  :verified,
                  :user_id,
                  :terms,
                  :logo,
                  :ceo,
                  :about_text,
                  :website,
                  :founded,
                  :logo,
                  :cover_photo,
                  category_ids: [],
                  addresses_attributes: [:id, 
                                      :continent, 
                                      :country, 
                                      :email,
                                      :city,
                                      :zip_code,
                                      :phone
                                    ]
                  
                )
  end
end