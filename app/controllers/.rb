class ProductsController < ApplicationController
  
  include Department_List
  include Admin
  
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :is_admin_, :only => [:new, :edit, :update, :destroy]

  
  # show all the products in database when URL/products request is recieved
  def index
    @products = if params[:search]
            Product.searchName(params[:search])
        else
            Product.all
        end
        
    @products = @products.paginate(page: params[:page],:per_page => 12)
    
  end
  
    # GET /products/new
  def new
    @product = Product.new
  end
  #Show a product
  
  def show
    @product = Product.find_by_id(params[:id])
  end
  
  def manage
     
      
      if params[:search].present?
            @products = Product.searchName(params[:search]).paginate(page: params[:page],:per_page => 12)
      else
            @products = Product.all.paginate(page: params[:page],:per_page => 12)
      end
      
  end
    
  
  def create
    @product = Product.new(product_params)
    @product.department = Product.find_the_department(params[:product][:department])
    @product.sub_department = Product.find_the_sub_department(params[:product][:sub_department])
    @product.brand = Product.find_the_brand(params[:product][:brand])
    

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  #destroy/delete a product
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #update an exisiting product
  def update
    respond_to do |format|
      if !@product.update_attributes(product_params).nil?
        format.html { redirect_to @product_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # edit the Product
  def edit
    @product = Product.find_by_id(params[:id])
  end
  
  def specs
    @product = Product.find(params[:id])
  end
  
  private 

  def set_product
      @product = Product.find(params[:id])
  end
  
  
  def product_params
      params.require(:product).permit(:name, :display_name, :from_country, :price,  :image, :description, :id)
  end
  

end
