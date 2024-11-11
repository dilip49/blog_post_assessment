require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  it { should belong_to(:user) }
  it { should have_one_attached(:file) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end
