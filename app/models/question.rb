# frozen_string_literal: true

class Question < ActiveRecord::Base
  
  enum question_types: [:essay_question] # add more question types here

  belongs_to :questionnaire
  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :question_type, presence: true
  validates :questionnaire_id, presence: true
end
