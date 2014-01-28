class Note < ActiveRecord::Base
  attr_accessible :department, :title
  has_many :segments
end
