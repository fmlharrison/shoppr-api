require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:list) }

  #Validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:quantity) }
end
