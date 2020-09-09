# frozen_string_literal: true

class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def to_dict
    puts user.id
    {
      id: id,
      title: title,
      body: body,
      address: address,
      created_at: created_at,
      updated_at: updated_at,
      image: image&.url,
      user: {
          id: user.id,
          name: user.name
      }
    }
  end
end
