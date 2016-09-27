require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { create(:bookmark) }

  it { is_expected.to validate_presence_of(:url) }
end
