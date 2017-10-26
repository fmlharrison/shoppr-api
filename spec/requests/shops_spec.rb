require 'rails_helper'

RSpec.describe 'Shops API', type: :request do
  # Setting up test data.
  let!(:shops) { create_list(:shop, 5) }
  let(:shop_id) { shops.first.id }

  describe 'GET /shops' do
    before { get '/shops'}

    it 'return all the shops' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


end