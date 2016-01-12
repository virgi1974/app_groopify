FactoryGirl.define do
  factory :user do |f|
    f.name "mrnobody"
    f.email "nobody@nobody"
    f.password "SunsetBoulevard"
    f.password_confirmation "SunsetBoulevard"

  end

  factory :invalid_article, parent: :user do |f|
    f.title nil
  end
# Factory(:user) --> we create a valid instance of our class


end