# == Schema Information
#
# Table name: raw_materials
#
#  id         :integer          not null, primary key
#  name       :string
#  form       :integer
#  category   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RawMaterial < ApplicationRecord
  enum form: [:powder, :liquid]
  enum category: [:active, :excepient]

  has_many :components
  has_many :combinations, through: :components

  validates :name, presence: true
  validates :form, presence: true
  validates :category, presence: true

  has_paper_trail

  def to_s
    name
  end
end
