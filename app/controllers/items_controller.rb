class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy_item]
  before_action :authenticate_user!

  # GET /items
  # GET /items.json
 # def index
   # @items = Item.all
  #end

  # GET /items/1
  # GET /items/1.json
  def show
    @cart = Cart.find(params[:cart_id])
    @item = @cart.items.find(params[:id])
    if @item.status != 1
        @item.status = 1
    else @item.status == 1
            @item.status = 0
    end
    @item.save
    redirect_to @cart
  end

  # GET /items/new
  #def new
  #  @item = Item.new
  #end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
      @cart = Cart.find(params[:cart_id])
      @item = @cart.items.create(item_params)
      #redirect_to cart_path(@cart)
      
      respond_to do |format|
      if @item.save
        format.html { redirect_to @cart, notice: 'Товаров добавлен в список.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @cart = Cart.find(params[:cart_id])
    @item = @cart.items.find(params[:id])
    @item.update(item_params)
       
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @cart, notice: 'Товаров изменен.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @cart = Cart.find(params[:cart_id])
    @item = @cart.items.find(params[:id])
    @item.destroy
    redirect_to cart_path(@cart)
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
      @cart = Cart.find(params[:cart_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :importance, :status)
    end
     
end
