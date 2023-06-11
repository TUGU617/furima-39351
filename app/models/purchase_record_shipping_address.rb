class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :pose_code, :prefecture_id, :municipalities, :address, :buildeing_name, :number, :purchase_record_id,
  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :number, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }
    validates :purchase_record_id
  end
  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, number: number, purchase_record_id: purchase_record.id)
  end
end