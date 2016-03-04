require 'rails_helper'

describe Article do
  it { should have_many :comments }
  it { should validate_presence_of :title }
  it { should validate_presence_of :text }
end