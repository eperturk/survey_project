class Patient < ActiveRecord::Base
  attr_accessible :dob, :doctor, :gender, :first_name, :middle_name, :last_name
  has_many :responses

  def self.find_patient(params)
    patient = Patient.where(
      :first_name => params["patient_first_name"], 
      :last_name => params["patient_last_name"], 
      :dob => params["patient_dob"]
      )
    return patient.first if patient.count == 1
  end

  def generate_patient_hash
    patient_hash = {"!!PATIENT_FIRST_NAME!!" => first_name,
                    "!!PATIENT_MIDDLE_NAME!!" => middle_name,
                    "!!PATIENT_LAST_NAME!!" =>  last_name,
                    "!!PATIENT_DOB!!" =>  dob.strftime("%Y-%m-%d"),
                    "!!PATIENT_DOCTOR!!" =>  doctor,
                    "!!PATIENT_GENDER!!" => gender
                    }
    return patient_hash
  end
end
