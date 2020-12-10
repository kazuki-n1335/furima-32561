class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_days

  belongs_to :user
  has_one_attached :image
end
