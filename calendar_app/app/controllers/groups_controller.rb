
# Author: SP
# Changes:
#   SP - Added admin support
#   KS - Added admin options
#   SP - Refractored KS's code.

class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :attribute]
  before_action :authenticate_user!
  respond_to :html, :js

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show

  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.users << current_user
    @group.admins << current_user

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }

      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @type = params[:type]
    if (@type.present?)
      user = User.find(params[:user_id])
      user_group = set_group
      if @type == "addAdmin" && !@group.admins.include?(user)
        @group.admins << user
      end
      if @type == "removeAdmin" && @group.admins.include?(user)
        @group.admins.delete(user)
      end
      if @type == "removeUser"
        user.groups.delete(user_group)
      end
    end

    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:type, :group, :calendar_id, :method, :user_id)
    end
  end
