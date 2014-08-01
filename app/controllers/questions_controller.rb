class QuestionsController < ApplicationController
	respond_to :html, :js

	def edit 
		@survey = Survey.find(params[:survey_id])
		@question = @survey.questions.find_by_id(params[:id])
		@next_seq = @question.last_answer_sequence+1
		if params['add_answer'].present?
			@add_answer = true
			@next_seq = params['add_answer'].to_i+1
		end
		if params['remove_answer'].present?
			@answer_to_remove = @question.answers.find_by_id(params['remove_answer'])
			@answer_to_remove.destroy
			@question = @survey.questions.find_by_id(params[:id])
			@remove_answer = true
		end
	end

	def new
		@survey = Survey.find(params[:survey_id].to_i)
		@question = @survey.questions.build
		@new_sequence = @survey.questions.count + 1
	end

	def create
		@survey = Survey.find(params[:question][:survey_id].to_i)
		@question = @survey.questions.create!(:text => params[:question][:text], :kind => params[:question][:kind], :sequence => params[:question][:sequence])
		@question.save
		redirect_to survey_path(@survey)
	end

	def update
		@survey = Survey.find(params[:survey_id])
		@question = @survey.questions.find_by_id(params[:id])
		@question.update_q_fields(params)
		if params[:answers].present?
			@question.update_answer_choices(params[:answers])
		end
		redirect_to survey_path(@survey)
	end

	def show
	end
end
