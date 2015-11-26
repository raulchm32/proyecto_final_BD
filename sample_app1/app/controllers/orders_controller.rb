class OrdersController < ApplicationController
  before_action :set_orders

  # GET /inventarios
  # GET /inventarios.json
  def index
    @order = Order.all
    @order_item = current_order.order_items.new
  end

  # GET /inventarios/1
  # GET /inventarios/1.json
  def show
  end

  # GET /inventarios/new
  def new
    @order = Order.new
  end

  # GET /inventarios/1/edit
  def edit
  end

  # POST /inventarios
  # POST /inventarios.json
  def create
    @order = Order.new
      if @order.save
        flash[:success] = "Elemento creado con exito"
        redirect_to @order
      else
        render 'new'
      end
  end

  # PATCH/PUT /inventarios/1
  # PATCH/PUT /inventarios/1.json
  def update
    respond_to do |format|
      if @order.update(inventario_params)
        flash[:success] = "Elemento updated"
        format.html { redirect_to @order }
      else
        render 'edit'
      end
      
    end
  end

  # DELETE /inventarios/1
  # DELETE /inventarios/1.json
  def destroy
    @order.destroy
    flash[:success] = "Elemento Destruido"
    redirect_to orders_url
  end
  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private
    def update_subtotal
        self[:subtotal] = subtotal
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_inventario
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventario_params
      params.require(:order).permit(:Nombre, :Cantidad, :Descripcion, :Preciounit)
    end
end
