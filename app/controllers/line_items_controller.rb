class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @isPresent= false
    
    @line_item = LineItem.find_by_id(params[:id])
    if @line_item.present?
      @isPresent = true
    else
    end
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
      product = Product.find_by_id(params[:product_id])

      @line_item = @cart.add_product(product)
    

    respond_to do |format|
      if @line_item.save
        #Line Item is updated (original msg)
        format.html { redirect_to cart_path(set_cart), notice: 'Product was successfully added.' }
        format.json { render :show, status: :created, location: @line_item }
        
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find_by_id(params[:id])
    if @line_item .present?
      @line_item.destroy
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      if (!LineItem.find_by_id(params[:id]).nil?)
        @line_item = LineItem.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
