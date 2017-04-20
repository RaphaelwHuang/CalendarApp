class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /schedule
  # GET /schedule.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedule/1
  # GET /schedule/1.json
  def show
  end

  # GET /schedule/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedule/1/edit
  def edit
  end

  # POST /schedule
  # POST /schedule.json
  def create
    @schedule = Schedule.new(schedule_params)
    @user = current_user
    @schedule.user_id = @user.id
    @group = Group.find(params[:group])  #WRONG!!! IF FIGURE OUT THIS, THE ADD MEETING CAN WORK
    @schedule.group_id = @group.id
    @schedule.save!
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule/1
  # PATCH/PUT /schedule/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_path)
        format.html { redirect_to @schedule, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule/1
  # DELETE /schedule/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def schedule_params
    params.require(:schedule).permit(:name, :start_time, :end_time, :start_day, :end_day, :user_id, :schedules_id)
  end
end
