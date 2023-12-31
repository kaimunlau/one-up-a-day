require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'has a unique email' do
    user2 = build(:user, email: @user.email)
    expect(user2).to_not be_valid
  end

  it 'is not valid without an email' do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

  it 'is not valid without a password' do
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end

  it 'is not valid without a first name' do
    user2 = build(:user, first_name: nil)
    expect(user2).to_not be_valid
  end
end
