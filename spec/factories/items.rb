FactoryGirl.define do
  factory :item do

    association :activity

    name {Faker::App.name}
    cost {Faker::Number.number(3)}
    
  end

end
