class ComprisesController < ApplicationController
  before_action :set_comprise, only: [:show, :edit, :update, :destroy]

  # GET /comprises
  # GET /comprises.json
  def index
    @comprises = Comprise.all
  end

  # GET /comprises/1
  # GET /comprises/1.json
  def show
  end

  # GET /comprises/new
  def new
    @comprise = Comprise.new
    # So you don't have to enter your own user_id when joining
    @comprise.user_id = current_user.id
  end

  # GET /comprises/1/edit
  def edit
  end

  # POST /comprises
  # POST /comprises.json
  def create
    @comprise = Comprise.new(comprise_params)
    @group = Group.find(@comprise.group_id)

    respond_to do |format|
      if @comprise.save
        format.html { redirect_to @group, notice: 'User successfully added to Group!' }
        format.json { render :show, status: :created, location: @comprise }
      else
        format.html { render :new }
        format.json { render json: @comprise.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /comprises/1
  # PATCH/PUT /comprises/1.json
  def update
    respond_to do |format|
      if @comprise.update(comprise_params)
        format.html { redirect_to @comprise, notice: 'Comprise was successfully updated.' }
        format.json { render :show, status: :ok, location: @comprise }
      else
        format.html { render :edit }
        format.json { render json: @comprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comprises/1
  # DELETE /comprises/1.json
  def destroy
    @comprise.destroy
    respond_to do |format|
      format.html { redirect_to comprises_url, notice: 'Comprise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comprise
      @comprise = Comprise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comprise_params
      params.require(:comprise).permit(:group_id, :user_id)
    end
end
