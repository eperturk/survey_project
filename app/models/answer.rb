class Answer < ActiveRecord::Base
  attr_accessible :text, :sequence
  belongs_to :question
end
