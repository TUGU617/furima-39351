class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :number, :purchase_record_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id

    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :number, format: { with: /\A\d{10,11}\z/}
  end
  

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    shipping_address = ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, number: number, purchase_record_id: purchase_record.id)
  end
end