FactoryGirl.define do

  factory :activity do
    
    association :user

    title { Faker::App.name }
    activity_begin { Faker::Date.forward(10) }
    activity_end { Faker::Date.forward(24) }

  end  

end