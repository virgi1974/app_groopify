FactoryGirl.define do
  factory :pet do |f|
    f.user_id 23
    f.name "blackie"
    f.race "doberman"
    f.age 7
  end
end