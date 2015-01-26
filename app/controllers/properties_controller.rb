class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  

  # GET /properties
  # GET /properties.json
  def full_list
    @properties = Property.all.order(sale_price: :desc)
  end

  def index 
    @properties = Property.all.order(created_at: :desc)
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    #before_action :authorize
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
  end

  def calculate
    @property = Property.new
  end


  
  # def calculate_profit_margin
  #   self.profit_percent = self.profit_margin / self.fix_costs
  # end
  # helper_method :calculate_profit_percent #needed if accessed by other views and not just controllers
 
  # POST /properties
  # POST /properties.json

  def create
    @property = Property.new(property_params)
    @property.profit_margin = @property.calculate_profit_margin
    @property.profit_percent = @property.calculate_profit_percent

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def current_property
      @current_property ||= Property.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_property #needed if accessed by other views and not just controllers


  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    @property = Property.find(params[:id])

    if @property.update(property_params)
      redirect_to properties_path
    # else
    #   render :edit
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:address, :list_price, :sale_price, :fix_costs, :time_held, :profit_margin, :profit_percent, :user_id)
    end
end
