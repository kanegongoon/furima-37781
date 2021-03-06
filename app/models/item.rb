class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  has_one :purchase_record
  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :shipping_charges_id, numericality: {other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :shipping_day_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/}
end