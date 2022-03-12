class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  belongs_to :category
end
# Category
# Cwner
