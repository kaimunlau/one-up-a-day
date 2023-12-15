require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = create(:tag)
  end

  it 'is valid with valid attributes' do
    expect(@tag).to be_valid
  end

  it 'is not valid without a title' do
    invalid_tag = build(:tag, title: nil)
    expect(invalid_tag).to_not be_valid
  end

  it 'is not valid with a non-unique title' do
    invalid_tag = build(:tag, title: @tag.title)
    expect(invalid_tag).to_not be_valid
  end
end
