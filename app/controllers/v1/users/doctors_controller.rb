module V1
  module Users
    class DoctorsController < ApplicationController
      include DoctorsCache
      before_action :set_doctor, only: [:show, :update, :destroy]

      # GET /doctors
      def index
        @doctors = fetch_doctors

        render json: @doctors
      end

      # GET /doctors/1
      def show
        render json: @doctor
      end

      # POST /doctors
      def create
        @doctor = Doctor.new(doctor_params[:doctor])
        @user = User.new(doctor_params[:user].merge(personable: @doctor))
        if @doctor.valid? && @user.valid?
          #type_personable is model name
          UserWorker::CreateAccount.perform_async(
            doctor_params[:doctor].to_json,
            doctor_params[:user].to_json,
            'doctor'
          )
          render json: {success: 'User doctor has successfully entered the queue'}, status: :created
        else
          errors_messages = @doctor.errors.full_messages + @user.errors.full_messages
          render json: { errors: errors_messages.flatten }, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_doctor
          @doctor = fetch_doctor(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def doctor_params
          params.require(:user_doctor).permit(
            user: [:name, :password, :password_confirmation, :email, :phone, :gender,
                  :secure_pin, :secure_pin_checkout, :user_type, :user_status, :login_status,
                  :user_identity_card, :fcm_token, :address, :country_id, :avatar],
            doctor: [:specialist_id, :workspace_id, :chat_price, :phone_price, :video_price]
          )
        end
    end
  end
end