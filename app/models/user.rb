# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User
  extend Enumerize
  include JpPrefecture

  jp_prefecture :prefecture_code, method_name: :prefecture

  validates :name, presence: true
  validates :email, presence: true

  has_many :events
end
