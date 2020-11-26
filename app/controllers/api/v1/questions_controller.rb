class Api::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:destroy]
  skip_before_action :verify_authenticity_token

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: { question: @question, status: :created }
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params[:question][:questionnaire_id] = params[:questionnaire_id] if params[:questionnaire_id]
      params.require(:question).permit(:title, :description, :question_type, :questionnaire_id)
    end
end
