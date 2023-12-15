require 'rails_helper'

RSpec.describe 'Tags', type: :request do
  describe 'GET /index' do
    before { get '/tags' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns @tags' do
      tag = Tag.create(title: 'ruby')
      expect(assigns(:tags)).to eq([tag])
    end
  end
end
