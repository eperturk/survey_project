class Question < ActiveRecord::Base
  attr_accessible :kind, :required, :text, :sequence
  belongs_to :survey
  has_many :answers, dependent: :destroy
end
