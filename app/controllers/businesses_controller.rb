class BusinessesController < ApplicationController
  
  before_action :authenticate_user! , except: [:index ,:show]
  before_action :set_business, only: %i[ show edit update destroy ]

  # GET /businesses or /businesses.json
  def index
    params.each do|k,v|
      params.delete(k) if v == ""
    end
    query = params[:search].present? ? params[:search] : '*'
    filters = params.except(:action, :controller,:search)
    @businesses =  Business.searchkick_search(query,where: filters).results
  end

  # GET /businesses/1 or /businesses/1.json
  def show
    
  end

  # GET /businesses/new
  def new
    @business = current_user.businesses.new
  end

  # GET /businesses/1/edit
  def edit
    authorize @business
  end

  # POST /businesses or /businesses.json
  def create
    @business = current_user.businesses.build(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to business_business_wizard_index_path(@business), notice: "Business was successfully created." }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1 or /businesses/1.json
  def update
    authorize @business
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: "Business was successfully updated." }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1 or /businesses/1.json
  def destroy
    authorize @business
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: "Business was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def remove
    
    @business = Business.find(params[:business_id])
    @photo = @business.photos.find(params[:photo_id])
    @photo.purge_later

    redirect_to business_path(@business), notice: "Photo was successfully removed."
  end

  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_business
    @business = Business.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
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

