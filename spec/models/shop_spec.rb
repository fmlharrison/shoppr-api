require 'rails_helper'

RSpec.describe Shop, type: :model do
  #Association test
  it { should have_one(:list).dependent(:destroy) }

  #Validation test
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:shopper) }
end
