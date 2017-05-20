require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) { |n| n }
    sequence(:nickname) { |n| "jarlax#{n}" }
    name "Sean"
    sequence(:email) { |n| "jarlax#{n}@launchacademy.com" }
    avatar_url "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    sequence(:token) { |n| "1234#{n}abc"}
  end
end
