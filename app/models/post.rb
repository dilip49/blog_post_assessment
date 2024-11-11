# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :file

  enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' }

  validates :title, :content, presence: true

  after_initialize :set_default_status, if: :new_record?
  
  private

  def set_default_status
    self.status ||= 'pending'
  end
end
