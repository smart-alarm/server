class UserHistoryRecordsController < ApplicationController
  before_action :set_user_history_record, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /user_history_records
  # GET /user_history_records.json
  def index
    @user_history_records = UserHistoryRecord.all
  end

  # POST /user_history_records
  # POST /user_history_records.json
  def create
    @user = User.find(params[:user_history_record][:user_id])
    if @user.authenticate(params[:password])
      @user_history_record = UserHistoryRecord.new(user_history_record_params)

      respond_to do |format|
        if @user_history_record.save
          format.html { redirect_to @user_history_record, notice: 'User history record was successfully created.' }
          format.json { render :show, status: :created, location: @user_history_record }
        else
          format.html { render :new }
          format.json { render json: @user_history_record.errors, status: :unprocessable_entity }
        end
      end
    else
      #Handle request failure

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_history_record
      @user_history_record = UserHistoryRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_history_record_params
      params.require(:user_history_record).permit(:user_id, :arrival, :on_time)
    end
end
