class Note < ActiveRecord::Base
  attr_accessible :department, :title, :survey_id
  has_many :segments
  belongs_to :survey
  validates_presence_of :survey_id

end
