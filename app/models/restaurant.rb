class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  belongs_to :category
  has_one_attached :profile do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end

  has_one_attached :cover
  has_many_attached :images

  validates :profile,
            content_type: [:gif, :png, :jpg, :jpeg],
            size: { less_than: 2.megabytes , message: 'must be less than 2MB in size' }

  validates :cover,
            content_type: [:gif, :png, :jpg, :jpeg],
            size: { less_than: 5.megabytes , message: 'must be less than 5MB in size' }

  validates :name, presence: true, length: { maximum: 20, minimum: 2 }
  # validates :address, presence: true, format: { with: /\d/, message: "only allows number" }
end
# Category
# Cwner
