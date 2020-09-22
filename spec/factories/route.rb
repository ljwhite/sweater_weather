FactoryBot.define do
  factory :route do
    sequence(:name) {|n| "Route #{n}" }
    type { "trad" }
    sequence(:rating) {|n| "5.#{n}" }
    location { ["state", "city", "park", "area", "route"] }
    sequence(:longitude) { |n| "-104.#{n}" }
    sequence(:latitude) { |n| "39.#{n}" }
    initialze_with { new(attributes) }
  end
end
