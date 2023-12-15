require 'rails_helper'

RSpec.describe UpdatePostsHelper, type: :helper do
  describe '#pretty_date_for' do
    it 'returns a pretty date' do
      date = Date.new(2019, 1, 1)
      expect(helper.pretty_date_for(date)).to eq('January  1, 2019')
    end
  end
end
