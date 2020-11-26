class Api::V1::QuestionnairesController < ApplicationController

  before_action :verify_auth_token

  def index
    @questionnaires = Questionnaire.all
    render json: { surveys: @questionnaires }
  end
end
