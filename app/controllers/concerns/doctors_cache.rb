require 'json'
module DoctorsCache
  def fetch_doctors
    doctors = Rails.cache.read("user/doctors")
    if doctors.nil?
      Rails.cache.fetch("user/doctors", expires_in: 5.minutes) do
        doctors = User.doctors.order(id: :desc).to_json
      end
    end
    @doctors = JSON.load doctors
  end

  def fetch_doctor(id)
    doctor = Rails.cache.read("user/doctor/#{id}")
    if doctor.nil?
      Rails.cache.fetch("user/doctor/#{id}", expires_in: 2.hours.to_i) do
        doctor = User.doctors.find_by_id(id).to_json
      end
    end
    @doctor = JSON.load doctor
  end
end
