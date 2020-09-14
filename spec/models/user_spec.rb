require 'rails_helper'
# Unitary test with Rspec
RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_length_of(:name).is_at_most(25) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
  # Unitary test with Rspec
  describe 'association' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:invitations) }
  end
end
