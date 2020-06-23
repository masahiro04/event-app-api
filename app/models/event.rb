# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
