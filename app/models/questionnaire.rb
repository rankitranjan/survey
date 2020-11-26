# frozen_string_literal: true

class Questionnaire < ActiveRecord::Base

  has_many :questions
  belongs_to :user
  validates :name, presence: true
end
