require 'json'
module PatientsCache
  def fetch_patients
    patients = Rails.cache.read("user/patients")
    if patients.nil?
      Rails.cache.fetch("user/patients", expires_in: 5.minutes) do
        patients = User.patients.order(id: :desc).to_json
      end
    end
    @patients = JSON.load patients
  end

  def fetch_patient(id)
    patient = Rails.cache.read("user/patient/#{id}")
    if patient.nil?
      Rails.cache.fetch("user/patient/#{id}", expires_in: 2.hours.to_i) do
        patient = User.patients.find_by_id(id).to_json
      end
    end
    @patient = JSON.load patient
  end
end
