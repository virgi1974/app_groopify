FactoryGirl.define do
  factory :pet do |f|
    f.user_id 23
    f.name "blackie"
    f.race "doberman"
    f.age 7
  end

   factory :invalid_pet do |f|
    f.user_id 23
    f.name ""
    f.race "doberman"
    f.age 7
  end

  factory :account do
      name "virgilio"
     email "virgifp@yahoo.es"
     password "password"
     password_confirmation "password"
   end
end