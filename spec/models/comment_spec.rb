require 'rails_helper'

describe Comment do

  describe 'associations' do
    it { should belong_to :article }
  end

  describe 'validations' do
    it { should validate_presence_of :body }
    it { should validate_length_of(:body).is_at_least(3).is_at_most(4000).on(:create) }
  end
  
end