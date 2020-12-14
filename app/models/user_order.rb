class UserOrder
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :house_number, :building_name, :telephone_number

  with_options presence: true do
    validates :post_number,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city,
    validates :house_number,
    validates :telephone_number, length: { maximum: 11 },  format: { with: /\A[0-9]/, message: 'is invalid. Input full-width numbers.' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end