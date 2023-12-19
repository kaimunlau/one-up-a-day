require 'rails_helper'

RSpec.describe 'UpdatePosts', type: :request do
  include Devise::Test::IntegrationHelpers

  before { get '/update_posts' }

  describe 'GET /update_posts' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#index' do
    let(:update_post1) { FactoryBot.create(:update_post) }
    let(:update_post2) { FactoryBot.create(:update_post, date: Date.today - 2) }

    it 'assigns @update_posts ordered by date' do
      expect(assigns(:update_posts)).to eq([update_post1, update_post2])
    end

    it 'assigns unique dates to @dates' do
      dates = assigns(:update_posts).map(&:date).uniq
      expect(assigns(:dates)).to eq(dates)
    end
  end

  describe '#new' do
    before { sign_in FactoryBot.create(:user) }
    it 'assigns a new UpdatePost to @update_post' do
      get '/update_posts/new'
      expect(assigns(:update_post)).to be_a_new(UpdatePost)
    end
  end

  describe '#create' do
    before { sign_in FactoryBot.create(:user) }
    context 'with valid attributes' do
      let(:valid_attributes) { FactoryBot.attributes_for(:update_post) }

      it 'creates a new UpdatePost' do
        expect { post '/update_posts', params: { update_post: valid_attributes } }.to change(UpdatePost, :count).by(1)
      end

      it 'redirects to the new update_post' do
        post '/update_posts', params: { update_post: valid_attributes }
        expect(response).to redirect_to(new_update_post_tag_update_post_path(UpdatePost.last))
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { FactoryBot.attributes_for(:update_post, title: nil) }

      it 'does not save the new update_post' do
        expect { post '/update_posts', params: { update_post: invalid_attributes } }.to_not change(UpdatePost, :count)
      end

      it 're-renders the new method' do
        post '/update_posts', params: { update_post: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end
