class Patient < ActiveRecord::Base
  attr_accessible :dob, :doctor, :gender, :name
end
