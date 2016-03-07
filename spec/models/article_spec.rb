require 'rails_helper'

describe Article do

  describe 'associations' do
    it { should have_many :comments }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end

  describe '#subject' do
    it 'returns article title' do
      # Arrange (prepare) object with Factory Girl
      article = create(:article, title: 'Test article')

      # Assert (checking/test)
      expect(article.subject).to eq 'Test article'
    end
  end
end