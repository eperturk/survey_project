class SurveysController < ApplicationController

	def new
		@survey = Survey.new
	end

	def index
		@surveys = Survey.all
	end

  def show
  	@survey = Survey.find(params[:id])
  	@questions = @survey.questions
  	if params[:question]
  		@question = Question.find(params[:question])
  		if @question.answers 
  			@answers = @question.answers
  		end
  	end
  end

  def create
  	@survey = Survey.create(params[:survey])
  	@survey.save
  	default_question = @survey.questions.create!(:text => "Sample Question", :kind => "multiple_choice")
  	redirect_to surveys_path, :notifice => "Survey Successfully Created"
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    @survey.update_attributes(params[:survey])
    redirect_to survey_path(@survey)
  end
end
