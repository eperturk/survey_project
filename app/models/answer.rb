class Answer < ActiveRecord::Base
  attr_accessible :text, :sequence
  belongs_to :question
  validates :sequence, :uniqueness => {:scope => :question_id}
  after_destroy :reorder_sequences
  after_create :reorder_sequences

  def reorder_sequences
    @question = self.question
    if @question.answers.present?
      @question.answers.each_with_index do |answer, seq|
        answer.sequence = seq+1
        answer.save
      end
    end
  end

end
