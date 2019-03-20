class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :page, presence: true, numericality: true
  validates :description, presence: true
end
