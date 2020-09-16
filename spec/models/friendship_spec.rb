require 'rails_helper'
# Unitary test with Rspec
RSpec.describe Invitation, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
  end
end
