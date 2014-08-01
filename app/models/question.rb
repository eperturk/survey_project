class Question < ActiveRecord::Base
  attr_accessible :kind, :required, :text, :sequence
  belongs_to :survey
  has_many :answers, dependent: :destroy

  def update_q_fields(params)
    self.text = params["question_text"]
    self.kind = params["question_kind"]
    self.save
  end

  def last_answer_sequence
    if self.answers.present?
      return self.answers.map(&:sequence).last
    else
      return 0
    end
  end

  def update_answer_choices(answer_hash)
    answer_hash.each do |sequence, text|
      if self.answers.where(sequence: sequence).present?
        answer = self.answers.where(sequence: sequence).first
        answer.text = text
        answer.save
      elsif text.present?
        new_answer = self.answers.create(text: text, sequence: sequence)
      end
    end
  end

end
