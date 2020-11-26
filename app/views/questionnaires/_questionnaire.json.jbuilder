json.extract! questionnaire, :id, :name, :description, :stat_date, :end_date, :status, :created_at, :updated_at
json.url questionnaire_url(questionnaire, format: :json)
