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

    context 'when a shop does not exists' do
      let(:shop_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a list' do
        expect(response.body).to match(/Couldn't find Shop/)
      end
    end
  end

  describe 'POST /shops/:shop_id/list' do
    let!(:new_shop) { create(:shop) }
    let(:new_shop_id) { new_shop.id }
    let(:valid_attributes) { { total_capacity: 20 } }

    context 'when request attributes are valid' do
      before { post "/shops/#{new_shop_id}/list", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'has a total capacity of 20' do
        expect(json['total_capacity']).to be(20)
      end
    end

    context 'when an invalid request' do
      before { post "/shops/#{new_shop_id}/list", params: valid_attributes }
      before { post "/shops/#{new_shop_id}/list", params: { bad_params: "wrong" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/This shop already has a list/)
      end
    end
  end
end
