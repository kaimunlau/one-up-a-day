require 'rails_helper'

RSpec.shared_examples 'an invalid update_post' do |invalid_attribute|
  it "is not valid without #{invalid_attribute}" do
    invalid_update_post = build_invalid_update_post(invalid_attribute => nil)
    expect(invalid_update_post).to_not be_valid
  end
end

RSpec.shared_examples 'a non-unique update_post date scoped to user' do
  it 'is not valid with a non-unique date scoped to user' do
    invalid_update_post = build_invalid_update_post(date: @update_post.date, user: @user)
    expect(invalid_update_post).to_not be_valid
  end
end

RSpec.describe UpdatePost, type: :model do
  before do
    @user = create(:user)
    @update_post = create(:update_post, user: @user)
  end

  def build_invalid_update_post(attributes = {})
    build(:update_post, attributes)
  end

  it 'is valid with valid attributes' do
    expect(@update_post).to be_valid
  end

  it 'has associated tags through tag_update_posts' do
    tag = create(:tag)
    @update_post.tags << tag
    expect(@update_post.tags).to include(tag)
  end

  context 'when invalid' do
    it_behaves_like 'an invalid update_post', :title
    it_behaves_like 'an invalid update_post', :content
    it_behaves_like 'an invalid update_post', :user
    it_behaves_like 'an invalid update_post', :date
    it_behaves_like 'a non-unique update_post date scoped to user'
  end
end
