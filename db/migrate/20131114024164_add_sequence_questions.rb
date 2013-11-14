class AddSequenceQuestions < ActiveRecord::Migration
	def change
		add_column :questions, :sequence, :integer
	end
end
