require 'rails_helper'
# Unitary test with Rspec
RSpec.describe Post, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:content) }
  end
  # Unitary test with Rspec
  describe 'association' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end
end
