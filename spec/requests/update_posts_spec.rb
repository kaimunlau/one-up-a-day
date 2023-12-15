require 'rails_helper'

RSpec.describe 'UpdatePosts', type: :request do
  describe 'GET /update_posts' do
    it 'returns http success' do
      get '/update_posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe '#index' do
    let(:update_post1) { FactoryBot.create(:update_post) }
    let(:update_post2) { FactoryBot.create(:update_post, date: Date.today - 2) }

    before do
      get '/update_posts'
    end

    it 'assigns @update_posts ordered by date' do
      expect(assigns(:update_posts)).to eq([update_post1, update_post2])
    end

    it 'assigns unique dates to @dates' do
      dates = assigns(:update_posts).map(&:date).uniq
      expect(assigns(:dates)).to eq(dates)
    end
  end
end
