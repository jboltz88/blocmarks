require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }

  it { is_expected.to validate_presence_of(:title) }
end
