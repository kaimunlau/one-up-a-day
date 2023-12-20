require 'rails_helper'

RSpec.describe 'TagUpdatePosts', type: :request do
  include Devise::Test::IntegrationHelpers

  describe '#add_tags' do
    let(:update_post) { create(:update_post) }
    let(:tags) { %w[tag1 tag2 tag3] }

    context 'when there are no errors' do
      it 'renders json with status :ok' do
        post tag_update_post_path(update_post), params: { tags: }

        expect(response).to have_http_status(302)
      end
    end
  end
end
