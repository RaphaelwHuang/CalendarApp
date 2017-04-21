
# Author: SP
# Changes:
#   SP - Added admin support
#   KS - Added admin options
#   SP - Refractored KS's code.
#   SP - Added promote, demote, remove methods as well as their helper
#     methods. Seriously cleaned up code.
#   KS - Added add method
#   SP - Methods deal with some unexpected conditions

class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy,\
   :attribute, :promote, :demote, :remove, :set_admins, :set_users]
  before_action :set_users, only: [:remove]
  before_action :set_admins, only: [:promote, :demote]
  before_action :set_user, only: [:promote, :demote, :remove]
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

  # PATCH /groups/1/promote.json
  def promote
    respond_to do |format|
      if !@admins.include?(@user)
        @admins << @user
        format.html { redirect_to @group, notice: "#{@user.fname} was promoted!" }

      else
        format.html { redirect_to @group, alert: "#{@user.fname} is already an Admin!" }

      end

      format.json { render :show, status: :ok, location: @group }
    end
  end

  # PATCH /groups/1/demote.json
  def demote
    respond_to do |format|
      if @admins.include?(@user)
        @admins.delete(@user)
        format.html { redirect_to @group, notice: "#{@user.fname} was demoted!" }

      else
        format.html { redirect_to @group, alert: "#{@user.fname} isn't an Admin!" }
      end

      format.json { render :show, status: :ok, location: @group }
    end
  end

  # PATCH /groups/1/add.json
  def add
    @user = User.find(params[:group][:id])
    @group = Group.find(params[:id])
    @users = @group.users
    respond_to do |format|
      if !@users.include?(@user)
        @user.groups << @group
        format.html { redirect_to @group, notice: "#{@user.fname} was added to #{@group.name}!" }
      else
        format.html { redirect_to @group, alert: "#{@user.fname} is already in #{@group.name}!" }
      end
      format.json { render :show, status: :ok, location: @group }
    end
  end

  # PATCH /groups/1/remove.json
  def remove
    respond_to do |format|
      @user.groups.delete(@group)
      # .any? because if the group is somehow full of NIL objects, then we should delete
      if @group.users.any?  
        format.html { redirect_to @group, notice: "#{@user.fname} was removed from #{@group.name}!" }
      else
        @group.destroy
        format.html { redirect_to @group, alert: "Group was removed because it's empty."}
      end
      format.json { render :index, status: :ok, location: @group }
    end
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

    def set_admins
      @admins = @group.admins
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_users
      @users = @group.users
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit( :name, :calendar_id, :method, :user_id)
    end
  end
