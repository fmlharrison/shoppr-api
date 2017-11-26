require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  let!(:shop) { create(:shop) }
  let!(:list) { create(:list, shop_id: shop.id) }
  let!(:items) { create_list(:item, 5, list_id: list.id) }
  let(:shop_id) { shop.id }
  let(:id) { items.first.id }

  describe 'GET /shops/:shop_id/list/items' do
    context 'when a list exists' do
      before { get "/shops/#{shop_id}/list/items" }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all the items' do
        expect(json.size).to eq(5)
      end
    end

    context 'when a list does not exists' do
      let!(:new_shop) { create(:shop) }
      let(:new_shop_id) { new_shop.id }

      before { get "/shops/#{new_shop_id}/list/items" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a list' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  describe 'GET /shops/:shop_id/list/items/:id' do
    before { get "/shops/#{shop_id}/list/items/#{id}" }

    context 'when a item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all the items' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when a list does not exists' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a list' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  describe 'POST /shops/:shop_id/list/item' do
    let(:valid_attributes) { { name: 'Bacon', brand: 'Tesco', max_price: 5, quantity: 1, comment: '8 rashes please.' } }

    context 'when request attributes are valid' do
      before { post "/shops/#{shop_id}/list/items", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'has correct attributes' do
        expect(json['name']).to eq('Bacon')
        expect(json['brand']).to eq('Tesco')
        expect(json['max_price']).to eq('5.0')
        expect(json['quantity']).to eq(1)
        expect(json['comment']).to eq('8 rashes please.')
      end
    end

    context 'when an invalid request' do
      before { post "/shops/#{shop_id}/list/items", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank, Quantity can't be blank/)
      end
    end
  end
  #
  # describe 'PUT /shops/:shop_id/list' do
  #   let(:valid_attributes) { { total_capacity: 25 } }
  #
  #   context 'when list exists' do
  #     before { put "/shops/#{shop_id}/list", params: valid_attributes }
  #
  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #
  #     it 'updates the item' do
  #       updated_list = List.find(list_id)
  #       expect(updated_list.total_capacity).to match(25)
  #     end
  #   end
  #
  #   context 'when the item does not exist' do
  #     let!(:other_shop) { create(:shop) }
  #     let(:other_shop_id) { other_shop.id }
  #     before { put "/shops/#{other_shop_id}/list", params: valid_attributes }
  #
  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end
  #
  #     it 'returns a not found message' do
  #       expect(response.body).to match(/Couldn't find List/)
  #     end
  #   end
  # end
  #
  # #Test suite for DELETE /shops/:id/list
  # describe 'DELETE /shops/:shop_id/list' do
  #   before { delete "/shops/#{shop_id}/list" }
  #
  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end
