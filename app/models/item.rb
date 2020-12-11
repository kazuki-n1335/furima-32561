class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :was_attached?
    validates :name, length: { maximum: 40 }
    validates :introduce, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
  end

  validates :value, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  def was_attached?
    image.attached?
  end
end
