FactoryGirl.define do
  factory :article do
    title "Article title"
    text "Article text"

    # create factory named 'article_with_comments'
    # for article with several comments connected
    factory :article_with_comments do
      after :create do |article, evaluator|
        create_list :comment, 3, article: article
      end
    end
  end
end