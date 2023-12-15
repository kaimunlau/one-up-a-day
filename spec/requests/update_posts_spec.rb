require 'rails_helper'

RSpec.describe 'UpdatePosts', type: :request do
  describe 'GET /update_posts' do
    it 'returns http success' do
      get '/update_posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe '#index' do
    it 'assigns @update_posts ordered by date' do
      update_post1 = FactoryBot.create(:update_post)
      update_post2 = FactoryBot.create(:update_post, date: Date.today - 1)
      get '/update_posts'
      expect(assigns(:update_posts)).to eq([update_post1, update_post2])
    end
  end
end
