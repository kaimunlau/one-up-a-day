require 'rails_helper'

RSpec.describe 'Tags', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/tags/'
      expect(response).to have_http_status(:success)
    end

    it 'assigns @tags' do
      tag = Tag.create(title: 'ruby')
      get '/tags/'
      expect(assigns(:tags)).to eq([tag])
    end

    it 'assigns @dates' do
      tag = Tag.create(title: 'ruby')
      post = UpdatePost.create(title: 'test', content: 'test', date: Date.today, user: create(:user))
      post.tags << tag
      get '/tags/'
      expect(assigns(:dates)).to eq([Date.today])
    end
  end
end
