class Post < ApplicationRecord
  belongs_to :user
  validates :title,
            presence: true,
            length: {maximum: 30, minimum: 0}
  validates :explanations,
            presence: true,
            length: {maximum: 50, minimum: 0}
end