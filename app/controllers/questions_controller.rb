class QuestionsController < ApplicationController

	def edit 
	end

	def new
		@survey = Survey.find(params[:survey_id].to_i)
		@question = @survey.questions.build
		@new_sequence = @survey.questions.count + 1
	end

	def create
		@survey = Survey.find(params[:survey_id])

		@question = @survey.questions.create!(:text => params[:question][:text], :sequence => params[:question][:sequence])
		@question.save
		redirect_to survey_path(@survey)

	end

	def show
	end
end
