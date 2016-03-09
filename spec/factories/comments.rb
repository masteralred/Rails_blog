FactoryGirl.define do
  factory :comment do
    author 'mike'
    sequence(:body) { |n| "Comment number #{n}" }
  end
end