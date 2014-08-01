class Response < ActiveRecord::Base
  attr_accessible :patient_id, :survey_id, :value
  belongs_to :patient
  belongs_to :survey

end
