require 'rails_helper'

describe Comment do

  describe 'associations' do
    it { should belong_to :article }
  end

  describe 'validations' do
    it { should validate_presence_of :body }
  end
  
end