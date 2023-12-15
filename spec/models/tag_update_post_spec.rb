require 'rails_helper'

RSpec.describe TagUpdatePost, type: :model do
  before do
    @tag_update_post = create(:tag_update_post)
  end

  it 'is valid with valid attributes' do
    expect(@tag_update_post).to be_valid
  end

  it 'is not valid without an update_post' do
    invalid_tag_update_post = build(:tag_update_post, update_post: nil)
    expect(invalid_tag_update_post).to_not be_valid
  end

  it 'is not valid without a tag' do
    invalid_tag_update_post = build(:tag_update_post, tag: nil)
    expect(invalid_tag_update_post).to_not be_valid
  end
end
