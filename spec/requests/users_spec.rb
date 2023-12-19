require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
  end

  describe '#index' do
    let!(:user1) { create(:user, first_name: 'B') }
    let!(:user2) { create(:user, first_name: 'A') }

    it 'assigns @users ordered by first_name' do
      get '/users'
      expect(assigns(:users)).to eq([user2, user1])
    end
  end
end
