class User < ApplicationRecord
  has_many :restaurants, class_name: "Restaurant", foreign_key: "owner_id"
end
