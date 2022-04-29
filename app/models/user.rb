class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :restaurants, class_name: "Restaurant", foreign_key: "owner_id"
  has_one_attached :avatar

  enum role: [:normal, :owner, :admin]
end
