class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :invitable

  has_many :agents, class_name: "User", foreign_key: "manager_id"

  belongs_to :manager, class_name: "User", optional: true
  belongs_to :company
  has_many :products, dependent: :destroy
end
