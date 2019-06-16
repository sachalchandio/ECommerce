class BrandsController < ApplicationController
    before_action :is_admin_, :only => [:new, :edit, :update, :destroy]
    
    def index
        @brands = Brand.all
    end 
    
    def new
        @brand= Brand.new
    end
    
    def edit
        @brand = Brand.find_by_id(params[:id])
    end
    
    def update
      @brand = Brand.find(params[:id])
      #  new_params = brand_params
      #  new_params["sub_department_ids"] = params["sub_department_ids"][1..-1].map(&:to_i)
      
      if @brand.update_attributes(brand_params)
        flash[:success] = "Brand updated"
        redirect_to @brand
      else
        render 'edit'
      end
    end
    
    def manage
        @brands = Brand.all.paginate(page: params[:page],:per_page => 12)
        
    end
    
    def create
        @brand = Brand.new(brand_params)
      #  @brand.name = params[:brand][:name]
        
       # new_array = params[:brand][:sub_department_ids]
        #new_array = new_array[1..-1].map(&:to_i)
        #@brand.sub_department_ids = new_array
        
        respond_to do |format|
          if @brand.save
            format.html { redirect_to @brand, notice: 'Brand was successfully created.' }
             @newVar = params[:sub_department_ids]
            format.json { render :show, status: :created, location: @brand }
          else
            format.html { render :new }
            format.json { render json: @brand.errors, status: :unprocessable_entity }
          end
         end
    end
    
    def show
        @brand = Brand.find_by_id(params[:id])
        #@id = params[:id]
        #@brand_id = (Brand.find_by_name(@id).id)
        
        #if params[:id].to_i == 0
        #   @brand = Brand.find_by_name(params[:id])
        #else
        #   @brand = Brand.find_by_id(params[:id])
        #end
        
        if @brand.present?
            @brands = Product.where(brand_id: @brand.id).paginate(page: params[:page],:per_page => 12)
        end
    end
    
    
    def brand_params
        params.require(:brand).permit(:name, sub_departments:[])
    end
    
    
    
end
