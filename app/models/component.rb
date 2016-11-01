# == Schema Information
#
# Table name: components
#
#  id             :integer          not null, primary key
#  combination_id :integer
#  raw_material   :string
#  volume         :decimal(9, 3)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_components_on_combination_id  (combination_id)
#
# Foreign Keys
#
#  fk_rails_3a5a0c1867  (combination_id => combinations.id)
#

class Component < ApplicationRecord
  belongs_to :combination
  belongs_to :raw_material

  has_paper_trail

  validates :raw_material_id, presence: true
  #validates :volume, presence: true
  validates :volume, numericality: true

  def to_s
    "#{raw_material}"
  end
end
