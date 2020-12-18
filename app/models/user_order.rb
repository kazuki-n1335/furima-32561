class UserOrder
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含めてください' }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A[0-9]/, message: 'は半角数字で入力してください' }, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "を入力してください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
