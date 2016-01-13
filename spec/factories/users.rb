FactoryGirl.define do
  factory :user do |f|
    f.name "mrnobody"
    f.email "Nobody123@nobody123.com"
    f.password "SunsetBoulevard"
    f.password_confirmation "SunsetBoulevard"

  end

  factory :user23, parent: :user do |f|
    f.id 23
  end
# Factory(:user) --> we create a valid instance of our class


end