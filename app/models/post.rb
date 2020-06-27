class Post < ApplicationRecord
  belongs_to :author
  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: { minimum: 15}, presence: true
end
