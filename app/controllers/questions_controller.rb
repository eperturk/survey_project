class QuestionsController < ApplicationController

	def edit 
		@question = Question.find(params[:id])
	end

	def new
		@survey = Survey.find(params[:survey_id].to_i)
		@question = @survey.questions.build
		@new_sequence = @survey.questions.count + 1
	end

	def create
		@survey = Survey.find(params[:question][:survey_id].to_i)
		@question = @survey.questions.create!(:text => params[:question][:text], :sequence => params[:question][:sequence])
		@question.save
		redirect_to survey_path(@survey)

	end

	def update
		@question = Question.find(params[:id])
		@survey = @question.survey
		@question.update_attributes(params[:question])
		@question.save
		redirect_to survey_path(@survey, :question => @question.id)
	end

	def show
	end
end
