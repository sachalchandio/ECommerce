class JoinOnDSdBsController < ApplicationController
  before_action :set_join_on_d_sd_b, only: [:show, :edit, :update, :destroy]
  

  # GET /join_on_d_sd_bs
  # GET /join_on_d_sd_bs.json
  def index
    @join_on_d_sd_bs = JoinOnDSdB.all
  end

  # GET /join_on_d_sd_bs/1
  # GET /join_on_d_sd_bs/1.json
  def show
    
  @join_on_d_sd_bs =  Product.where(brand_id: params[:id], sub_department_id: params[:sub_department_id]).paginate(page: params[:page],:per_page => 12)
   
  end

  # GET /join_on_d_sd_bs/new
  def new
    @subdept = SubDepartment.all
    @join_on_d_sd_b = JoinOnDSdB.new
    
  end

  # GET /join_on_d_sd_bs/1/edit
  def edit
  end

  # POST /join_on_d_sd_bs
  # POST /join_on_d_sd_bs.json
  def create
    
    @join_on_d_sd_b = JoinOnDSdB.new(join_on_d_sd_b_params)
    
   
    respond_to do |format|
      if @join_on_d_sd_b.save
        format.html { redirect_to @join_on_d_sd_b, notice: 'Join on d sd b was successfully created.' }
        format.json { render :show, status: :created, location: @join_on_d_sd_b }
      else
        format.html { render :new }
        format.json { render json: @join_on_d_sd_b.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /join_on_d_sd_bs/1
  # PATCH/PUT /join_on_d_sd_bs/1.json
  def update
    respond_to do |format|
      if @join_on_d_sd_b.update(join_on_d_sd_b_params)
        format.html { redirect_to @join_on_d_sd_b, notice: 'Join on d sd b was successfully updated.' }
        format.json { render :show, status: :ok, location: @join_on_d_sd_b }
      else
        format.html { render :edit }
        format.json { render json: @join_on_d_sd_b.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /join_on_d_sd_bs/1
  # DELETE /join_on_d_sd_bs/1.json
  def destroy
    @join_on_d_sd_b.destroy
    respond_to do |format|
      format.html { redirect_to join_on_d_sd_bs_url, notice: 'Join on d sd b was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_on_d_sd_b
      #params[:id] is brand Name
      #params[:sub_department_id] is SubDepartmentID
      if params[:id].to_i == 0
        @join_on_d_sd_b = JoinOnDSdB.where(brand_id: (Brand.find_by_name(params[:id]).id), sub_department_id: params[:sub_department_id] )
      else
        @join_on_d_sd_b = JoinOnDSdB.find_by_id(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def join_on_d_sd_b_params
      params.require(:join_on_d_sd_b).permit(:name, :sub_department_ids)
    end
end
