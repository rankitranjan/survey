json.extract! question, :id, :title, :description, :question_type, :questionnaire_id, :created_at, :updated_at
json.url question_url(question, format: :json)
