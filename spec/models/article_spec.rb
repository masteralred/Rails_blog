require 'rails_helper'

describe Article do

  describe 'associations' do
    it { should have_many :comments }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
    it { should validate_length_of(:title).is_at_least(3).is_at_most(140).on(:create) }
  end

  describe '#subject' do
    it 'returns article title' do
      # Arrange (prepare) instance with Factory Girl
      article = create(:article, title: 'Test article')

      # Assert (checking/test)
      expect(article.subject).to eq 'Test article'
    end
  end

  describe '#last_comment' do
    it 'returns Article last commentary' do
      # Arrange instance, but this time with comments
      article = create(:article_with_comments)

      # Assert
      expect(article.last_comment.body).to eq 'Comment number 3'
    end
  end
end