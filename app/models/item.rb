class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: {other_than: 1}
  validates :condition_id, numericality: {other_than: 1}
  validates :shipping_charges_id, numericality: {other_than: 1}
  validates :prefecture_id, numericality: {other_than: 0}
  validates :shipping_day_id, numericality: {other_than: 1}
  validates :price, presence: true, format: {with: /\A[0-9]+\z/ }
end