class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  belongs_to :category

  validates :name, presence: true, length: { maximum: 20, minimum: 2 }
  # validates :address, presence: true, format: { with: /\d/, message: "only allows number" }
end
# Category
# Cwner
