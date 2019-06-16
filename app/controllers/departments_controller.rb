class DepartmentsController < ApplicationController
    before_action :is_admin_, :only => [:new, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_department
    def new
        @department = Department.new
    end
    
    def index
        @departments = Department.all
    end
    
    def edit
         @department = Department.find(params[:id])
    end
    
    def update
        @department = Department.find(params[:id])
        if @department.update_attributes(params_department)
             flash[:success] = "Department updated"
             redirect_to @department
        else
            render 'edit'
        end
    end
    
    def show
        @id = params[:id]
        @brands = []
        
        
        if params[:id].to_i == 0
           @department = Brand.find_by_name(params[:id])
        else
           @department= Brand.find_by_id(@id)
        end
        
        if @department.present?
           @departments = Product.where(brand_id: @department.id).paginate(page: params[:page],:per_page => 12)
        end
    end
    
    
    def create
        @department = Department.new(params_department)
        respond_to do |format|
            if @department.save
                format.html { redirect_to @department, notice: 'Department was successfully created.' }
                format.json { render :show, status: :created, location: @department }
            else
                format.html { render :new }
                format.json { render json: @department.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def params_department
        params.require(:department).permit(:name)
        
    end
    
    def invalid_department
        logger.error "Attempt to access invalid department #{params[:id]}"
        redirect_to departments_path , notice: 'Invalid Department'
    end
    
    
    
    def destroy
      Department.find(params[:id]).destroy
      flash[:success] = "Department deleted"
      redirect_to departments_url
    end

end
