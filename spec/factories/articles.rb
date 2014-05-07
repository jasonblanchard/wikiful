# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "MyString"
    content "MyText"

    before(:create) do |article, evaluator|
      article.categories << FactoryGirl.create(:category)
      article.save
    end
  end

end
