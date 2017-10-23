require 'rails_helper'

RSpec.describe List, type: :model do
  it { should belong_to(:shop) }
  it { should have_many(:items) }

  #Validation test
  it { should validate_presence_of(:total_capacity) }
end
