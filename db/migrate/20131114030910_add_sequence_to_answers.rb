class AddSequenceToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :sequence, :int
  end
end
