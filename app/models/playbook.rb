class Playbook < ApplicationRecord
  belongs_to :product

  with_options dependent: :destroy do |assoc|
    assoc.has_many :goals
    assoc.has_many :sections
  end
end
