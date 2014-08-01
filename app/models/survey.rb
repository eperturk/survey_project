class Survey < ActiveRecord::Base
  attr_accessible :title, :type, :id
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :notes

  def next_question_sequence
    if self.questions.present?
      return self.questions.sort_by(&:sequence).last.sequence+1
    else
      return 1
    end
  end
end
