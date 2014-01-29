class Note < ActiveRecord::Base
  attr_accessible :department, :title, :survey_id
  has_many :segments
  belongs_to :survey
end
