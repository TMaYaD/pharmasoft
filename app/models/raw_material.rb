class RawMaterial < ApplicationRecord
  has_many :components
  has_many :combinations, through: :components

  enum form: [:powder, :liquid]
  enum category: [:active, :excepient]
end
