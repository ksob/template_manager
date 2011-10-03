# coding: utf-8

FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "username_#{n}@example.com" }
    sequence(:password) { |n| "password" }
  end

end