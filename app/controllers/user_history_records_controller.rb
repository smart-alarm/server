class UserHistoryRecordsController < ApplicationController
  before_action :confirm_logged_in, except: [:create]
  before_action :set_user_history_record, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /user_history_records
  # GET /user_history_records.json
  def index
    @user_history_records = UserHistoryRecord.all
    num_on_time_by_day = UserHistoryRecord.group_by_day(:arrival, format: "%B %d, %Y").where(:on_time => true).count
    total_by_day = UserHistoryRecord.group_by_day(:arrival, format: "%B %d, %Y").count
    @percent_on_time_by_day = num_on_time_by_day
    @percent_on_time_by_day.each do |key, record|
      if record != 0
        @percent_on_time_by_day[key] = record / total_by_day[key].to_f
      end
    end

    user_on_time = UserHistoryRecord.group(:uuid).where(:on_time => true).count
    user_late = UserHistoryRecord.group(:uuid).where(:on_time => false).count
    @group_by_user = [{:name => 'On Time', :data => user_on_time}, {:name => 'Late', :data => user_late}]

  end

  # POST /user_history_records
  # POST /user_history_records.json
  def create
    @user_history_record = UserHistoryRecord.new(user_history_record_params)

    respond_to do |format|
      if @user_history_record.save
        format.html { redirect_to @user_history_record, notice: 'User history record was successfully created.' }
        format.json { 
          response = Hash.new
          response['status'] = "Successfully uploaded!"
          response['record'] = @user_history_record
          render json: response
        }
      else
        format.html { render :new }
        format.json { render json: @user_history_record.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_history_record
      @user_history_record = UserHistoryRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_history_record_params
      params.require(:user_history_record).permit(:uuid, :arrival, :on_time)
    end
end
