class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :edit, :update, :destroy]

  # GET /buyers
  # GET /buyers.json
  def index
    @buyers = Buyer.all
  end

  # GET /buyers/1
  # GET /buyers/1.json
  def show
  end

  # GET /buyers/new
  def new
    @buyer = Buyer.new
  end

  # GET /buyers/1/edit
  def edit
  end

  # POST /buyers
  # POST /buyers.json
  
  def create
    @buyer = Buyer.new(buyer_params)
      if @buyer.save
        flash[:success] = "Comprador creado con exito"
        redirect_to @buyer
      else
        render 'new'
      end
  end

  # PATCH/PUT /buyers/1
  # PATCH/PUT /buyers/1.json
  def update
    respond_to do |format|
      if @buyer.update(buyer_params)
        flash[:success] = "Elemento updated"
        format.html { redirect_to @buyer }
      else
        render 'edit'
      end
      
    end
  end
  # DELETE /buyers/1
  # DELETE /buyers/1.json

  def destroy
    @buyer.destroy
    flash[:success] = "Comprador Destruido"
    redirect_to buyers_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buyer_params
      params.require(:buyer).permit(:Index, :Nombre, :Direccion, :Telefono)
    end
end
