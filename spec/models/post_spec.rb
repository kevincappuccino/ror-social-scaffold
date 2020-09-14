require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:content) }
  end

  describe 'association' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end
end
