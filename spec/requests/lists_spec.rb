require 'rails_helper'

RSpec.describe 'Lists API', type: :request do
  let!(:shop) { create(:shop) }
  let!(:list) { create(:list, shop_id: shop.id) }
  let(:shop_id) { shop.id }
  let(:list_id) { list.id }

  describe 'GET /shops/:shop_id/list' do
    before { get "/shops/#{shop_id}/list" }

    context 'when a list exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a list' do
        expect(json['id']).to eq(list_id)
      end
    end
  end
end
