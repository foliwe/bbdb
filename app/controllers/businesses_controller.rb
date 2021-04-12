class BusinessesController < ApplicationController
  before_action :authenticate_user! , except: [:index ,:show]
  before_action :set_business, only: %i[ show edit update destroy ]

  # GET /businesses or /businesses.json
  def index
   
    #sanitize_params
    # query = params[:search].present? ? params[:search] : '*'
    # filters = params.except(:action, :controller,:search)
    
    
    @q = Business.ransack(params[:q])
    @businesses = @q.result.includes(:addresses, :categories,:user, :logo_attachment).order(point: :desc)
    #params[:q].delete_if {|k, v| keys.include?(k) && v == '0' }
    @pagy , @businesses = pagy(@businesses)

   
    # or use `to_a.uniq` to remove duplicates (can also be done in the view):
    #@business = @q.result.includes(:adddresses).page(params[:page]).to_a.uniq
  end

  # GET /businesses/1 or /businesses/1.json
  def show  
    set_meta_tags title: @business.business_name, 
            description: @business.about_text, 
            twitter: {
              card: "summary",
              site: "@crazycatlady",
              title: @business.business_name,
              description:  @business.about_text
            },
            og: {
              title: @business.business_name,
              description:  @business.about_text,
              type:     'website',
              url:      business_url(@business),
            }
            
    @similar_businesses = Business.similar_business( @biz_cat)
    owner = @business.user
    @user = owner.businesses
    @address_count = @business.addresses.first.country if  @business.addresses.present?
    @address_country = @business.addresses.pluck(:country) if  @business.addresses.present?

    #render json: @address_country
    
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
 def sanitize_params
  keys = ['verified', 'accepts_partnership']; 
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
                  :about_text,
                  :logo,
                  :cover_photo,
                  category_ids: [],
                  addresses_attributes: [:_destroy,
                                      :id, 
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

