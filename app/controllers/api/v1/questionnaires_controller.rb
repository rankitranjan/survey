class Api::V1::QuestionnairesController < ApplicationController

  def index
    @questionnaires = Questionnaire.all
    render json: { surveys: @questionnaires }
  end
end
