module V1
  module Users
    class PatientsController < ApplicationController
      include PatientsCache
      before_action :set_patient, only: :show

      # GET /patients
      def index
        @patients = fetch_patients

        render json: @patients
      end

      # GET /patients/1
      def show
        render json: @patient
      end

      # POST /patients
      def create
        @patient = Patient.new(patient_params[:patient])
        @user = User.new(patient_params[:user].merge(personable: @patient))
        if @patient.valid? && @user.valid?
          #type_personable is model name
          UserWorker::CreateAccount.perform_async(
            patient_params[:patient].to_json,
            patient_params[:user].to_json,
            'patient'
          )
          render json: {success: 'User patient has successfully entered the queue'}, status: :created
        else
          errors_messages = @patient.errors.full_messages + @user.errors.full_messages
          render json: { errors: errors_messages.flatten }, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_patient
          @patient = fetch_patient(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def patient_params
          params.require(:user_patient).permit(
            user: [:name, :password, :password_confirmation, :email, :phone, :gender,
                  :secure_pin, :secure_pin_checkout, :user_type, :user_status, :login_status,
                  :user_identity_card, :fcm_token, :address, :country_id, :avatar],
            patient: [:weight, :height]
          )
        end
    end
  end
end
