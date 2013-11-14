class Survey < ActiveRecord::Base
  attr_accessible :title, :type, :id
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
end
