class Comment < ApplicationRecord
  validate :body, presence: true

  belongs_to :product
  belongs_to :user
end
