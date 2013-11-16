class AnswersController < ApplicationController

	def new
		@question = Question.find(params[:question_id])
		@answer = Answer.new
	end

	def edit
		@question = Question.find(params[:question_id])
		@answers = @question.answers

	end

	def create
		@survey = Survey.find(params[:survey_id])
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create(:text => params[:text], :sequence => 1)
		@answer.save
		redirect_to survey_path(@survey, :question => @question.id)
	end

	def update
		@answer = Answer.find(params[:id])
		@question = @answer.question
		@survey = @question.survey
		i = 1
		for i in i..10
			if params["answer_#{i}_text"]
				if @question.answers.where(:sequence => i).blank? == false 
					answer = @question.answers.where(:sequence => i).first
					answer.text = params["answer_#{i}_text"]
					answer.save
				else						
					new_sequence = i
					new_answer = @question.answers.create(:text => params["answer_#{i}_text"], :sequence => i)
					new_answer.save
				end
			end
		end
		redirect_to survey_path(@survey, :question => @question.id )
	end

end