# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'dadada' }
    email { FFaker::Internet.email }
    password '11111111'
  end
end
