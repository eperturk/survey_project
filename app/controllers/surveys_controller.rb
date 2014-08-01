class SurveysController < ApplicationController
  respond_to :html, :js

	def new
		@survey = Survey.new
	end

	def index
		@surveys = Survey.all
	end

  def show
  	@survey = Survey.find(params[:id])
  	@questions = @survey.questions.sort_by(&:sequence)
    if params["new_question"].present?
      @new_question_sequence = params["new_question"]
      @survey.questions.create(sequence: @new_question_sequence, kind: "choose_one")
      @questions = @survey.questions.sort_by(&:sequence)
      @add_question = true
    end
  end

  def create
  	@survey = Survey.create(params[:survey])
  	@survey.save
  	default_question = @survey.questions.create!(:text => "Sample Question", :kind => "multiple_choice", sequence: 1)
  	redirect_to surveys_path, :notice => "Survey Successfully Created"
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    @survey.update_attributes(params[:survey])
    redirect_to survey_path(@survey)
  end

  def take
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    @patients = Patient.all
    render :layout => 'take'
  end

  def submit
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    response_hash = {}
    @questions.each do |question|
      if params["question_#{question.id}"]
        response_hash["question_#{question.id}"] = params["question_#{question.id}"]
      end
    end
    patient = Patient.find_by_id(params['chosen_patient'])
    new_response = patient.responses.create(:survey_id => @survey.id, :value => response_hash.to_json)
    new_response.save
    render :text => "Thank you for submitting your responses!"
  end

end









