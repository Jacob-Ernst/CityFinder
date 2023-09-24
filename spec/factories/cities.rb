# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    state { Faker::Address.state_abbr }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    population { Faker::Number.number(digits: 7) }
  end
end
