class Section < ApplicationRecord
  belongs_to :playbook
  has_many :scripts, dependent: :destroy
end
