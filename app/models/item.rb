class Item < ApplicationRecord
  validates :image, presence: true
  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :situation_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :date_of_shipment_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,presence: true
  validates :price, format: { with: /\A\d+\z/, message: "半角数値のみ入力してください" }
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    only_integer: true}

  has_one_attached :image
  has_one :purchase_record
  belongs_to :user
  has_one :shipping_address,through: :purchase_record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :Situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :date_of_shipment
end
