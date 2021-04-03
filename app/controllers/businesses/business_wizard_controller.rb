class Businesses::BusinessWizardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business, only: [:show, :update, :finish_wizard_path]
  include Wicked::Wizard

  steps :basic_info, :media, :category#, :address




  # POST /businesses or /businesses.json
  

  # PATCH/PUT /businesses/1 or /businesses/1.json
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
      when :media
        @business.update(business_params)
      when :category
        @business.update(business_params)
      # when :address
      #   @business.update(business_params)
    end
    render_wizard @business
  end

  def show
    authorize @business, :edit?
  case step
    when :basic_info
    when :media 
    when :category
  end
    if wizard_steps.any? && wizard_steps.index(step).present?
        @progress = ((wizard_steps.index(step) + 1) * 100) / wizard_steps.count
      else 
        @progress = 0
    end
   
      render_wizard
  end

  def finish_wizard_path(params)
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
                    :accepts_partnership,
                    :number_of_employee,
                    :logo,
                     :cover_photo,
                     category_ids: [],
                    addresses_attributes: [
                    :continent, :country, :city, :email , :phone, :zip_code]
                  )
  end
end