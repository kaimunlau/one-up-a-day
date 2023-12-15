require 'rails_helper'

RSpec.shared_examples 'an invalid update' do |invalid_attribute|
  it "is not valid without #{invalid_attribute}" do
    invalid_update = build_invalid_update(invalid_attribute => nil)
    expect(invalid_update).to_not be_valid
  end
end

RSpec.shared_examples 'a non-unique update date scoped to user' do
  it 'is not valid with a non-unique date scoped to user' do
    invalid_update = build_invalid_update(date: @update.date, user: @user)
    expect(invalid_update).to_not be_valid
  end
end

RSpec.describe Update, type: :model do
  before do
    @user = create(:user)
    @update = create(:update, user: @user)
  end

  def build_invalid_update(attributes = {})
    build(:update, attributes)
  end

  it 'is valid with valid attributes' do
    expect(@update).to be_valid
  end

  context 'when invalid' do
    it_behaves_like 'an invalid update', :title
    it_behaves_like 'an invalid update', :content
    it_behaves_like 'an invalid update', :user
    it_behaves_like 'an invalid update', :date
    it_behaves_like 'a non-unique update date scoped to user'
  end
end
