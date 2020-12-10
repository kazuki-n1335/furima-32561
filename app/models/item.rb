class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_days

  belongs_to :user
  has_one_attached :image

  validates :was_attached?, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :introduce, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :item_status_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_fee_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_days_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :value, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  def was_attached?
    self.image.attached?
  end
end
