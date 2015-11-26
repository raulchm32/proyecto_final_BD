class InventariosController < ApplicationController
  before_action :set_inventario, only: [:show, :edit, :update, :destroy]

  # GET /inventarios
  # GET /inventarios.json
  def index
    @inventarios = Inventario.all
    @order_item = current_order.order_items.new
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'index',
        layout: 'layouts/application.pdf.erb'
      end
    end
  end

  # GET /inventarios/1
  # GET /inventarios/1.json
  def show
  end
  

  # GET /inventarios/new
  def new
    @inventario = Inventario.new
  end

  # GET /inventarios/1/edit
  def edit
  end

  # POST /inventarios
  # POST /inventarios.json
  def create
    @inventario = Inventario.new(inventario_params)
      if @inventario.save
        flash[:success] = "Elemento creado con exito"
        redirect_to @inventario
      else
        render 'new'
      end
  end

  # PATCH/PUT /inventarios/1
  # PATCH/PUT /inventarios/1.json
  def update
    respond_to do |format|
      if @inventario.update(inventario_params)
        flash[:success] = "Elemento updated"
        format.html { redirect_to @inventario }
      else
        render 'edit'
      end
      
    end
  end

  # DELETE /inventarios/1
  # DELETE /inventarios/1.json
  def destroy
    @inventario.destroy
    flash[:success] = "Elemento Destruido"
    redirect_to inventarios_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventario
      @inventario = Inventario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventario_params
      params.require(:inventario).permit(:Nombre, :Cantidad, :Descripcion, :Preciounit)
    end
end
