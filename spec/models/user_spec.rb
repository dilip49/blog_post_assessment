# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:user) }
  it { should have_one_attached(:file) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  describe 'enum status' do
    let(:blog_post) { Post.new }

    it 'defines the correct enum values' do
      expect(described_class.statuses).to include(
        'pending' => 'pending',
        'approved' => 'approved',
        'rejected' => 'rejected'
      )
    end

    it 'defaults to pending' do
      expect(blog_post.status).to eq('pending')
    end

    it 'can change to approved' do
      blog_post.status = 'approved'
      expect(blog_post.status).to eq('approved')
    end

    it 'raises an error for invalid statuses' do
      expect { Post.new(status: 'invalid') }.to raise_error(ArgumentError)
    end
  end
end
