class SubDepartmentsController < ApplicationController
    before_action :is_admin_, :only => [:new, :edit, :update]
    
    def index
        @subdepartments =  if params[:search]
            SubDepartment.searchName(params[:search])
        elsif params[:search]==""
            SubDepartment.all
        else
            SubDepartment.all
        end
        
    end 
    
    def new
        @subdepartment  = SubDepartment.new
    end
    
    def show
        @subDepartment = SubDepartment.find_by_id(params[:id])
        @sub_departments= @subDepartment.products.paginate(page: params[:page],:per_page => 12)
        #@id = params[:name]
       # if params[:name].to_i == 0 
        #    @sub_departments = Product.where(sub_department_id: @subDept.id)
        #     @sub_departments = @sub_departments.paginate(page: params[:page], :per_page => 12)
        #else
        #    @subDept = SubDepartment.find_by_id(params[:name])
        #    @relativeProducts = Product.where(sub_department_id: subDeptID.id).pluck(:name)
        #    @sub_departments = Product.where(sub_department_id: @subDept.id)
        #    @sub_departments = @sub_departments.paginate(page: params[:page], :per_page => 12)
            #since params[:name] is an id so @subName become an id int he show.html.erb
        #end
    end
    
    def manage
         @sub_departments = SubDepartment.all.paginate(page: params[:page],:per_page => 12)
    end
    
    def create
        
        department_id = Department.find_by_name(params[:sub_department][:department_id])
        @subdepartment = SubDepartment.new(subdepartment_params)
        @subdepartment.department = department_id
        @subdepartment.name = @subdepartment.name.slice(0,1).capitalize + @subdepartment.name.slice(1..-1) 
        
        respond_to do |format|
            if @subdepartment.save
                
                @isSubDepartment = true #validation in HTML so that when show render
                
                format.html { redirect_to @subdepartment, notice: 'Sub Department was successfully created.'}
                format.json { render :show, status: :created, location: @department }
            else
                format.html { render :new }
                format.json { render json: @subdepartment.errors, status: :unprocessable_entity }
            end
        end
    end
    
    
    def edit
         @subdepartment = SubDepartment.find(params[:id])
    end
    
    def update
        @subdepartment = SubDepartment.find(params[:id])
        if @subdepartment.update_attributes(subdepartment_params)
            flash[:success] = "Sub Department updated"
            redirect_to sub_department_path
        else
            render 'edit'
        end
    end
    
    def destroy
        SubDepartment.find(params[:id]).destroy
        flash[:success] = "Sub Department deleted"
        redirect_to sub_departments_url
    end
    
    
    def subdepartment_params
        params.require(:sub_department).permit(:name)
        
    end
    
end
