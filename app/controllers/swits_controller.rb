class SwitsController < ApplicationController
  before_action :set_swit, only: [:show, :edit, :update, :destroy]

  # GET /swits
  # GET /swits.json
  def index
    @swits = Swit.all
  end

  # GET /swits/1
  # GET /swits/1.json
  def show
  end

  # GET /swits/new
  def new
    @swit = Swit.new
  end

  # GET /swits/1/edit
  def edit
  end

  # POST /swits
  # POST /swits.json
  def create
    @swit = Swit.new(swit_params)

    respond_to do |format|
      if @swit.save
        flash[:success] = 'Swit was successfully created.'
        format.html { redirect_to @swit }
        format.json { render :show, status: :created, location: @swit }
      else
        format.html { render :new }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swits/1
  # PATCH/PUT /swits/1.json
  def update
    respond_to do |format|
      if @swit.update(swit_params)
        flash[:success] = 'Swit was successfully updated.'
        format.html { redirect_to @swit }
        format.json { render :show, status: :ok, location: @swit }
      else
        format.html { render :edit }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swits/1
  # DELETE /swits/1.json
  def destroy
    @swit.destroy
    @swits = Swit.all
    
    respond_to do |format|
      format.js
    end
  end

  def post_swit
    @current_user = User.find(session[:user_id])
    @current_swit = @current_user.swits.create(content: params[:content])

    # Find tags
    params[:content].scan(/\{.*?\}/).each do |tag|
      @current_swit.tags.create(content: tag)
    end

    @swits = Swit.all

    respond_to do |format|
      format.js
    end

  end

  def sweet
    @current_user = User.find(session[:user_id])
    @current_swit = Swit.find(params[:swit_id])
    temp = @current_swit.ratings.find_or_create_by(:user_id => @current_user.id)
    temp.update_attributes(:rate => '1')
    
    @swits = Swit.all

    respond_to do |format|
      format.js
    end
  end

  def sour
    @current_user = User.find(session[:user_id])
    @current_swit = Swit.find(params[:swit_id])
    temp = @current_swit.ratings.find_or_create_by(:user_id => @current_user.id)
    temp.update_attributes(:rate => '0')
    
    @swits = Swit.all

    respond_to do |format|
      format.js
    end
  end

  def comment
    @current_user = User.find(session[:user_id])
    @current_swit = Swit.find(params[:swit_id])
    @current_swit.comments.create(content: params[:content], user_id: session[:user_id])

    @swits = Swit.all

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit
      @swit = Swit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_params
      params.require(:swit).permit(:user_id, :content)
    end
end
