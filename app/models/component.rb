# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

# == Schema Information
#
# Table name: components
#
#  id              :integer          not null, primary key
#  combination_id  :integer
#  raw_material_id :integer
#  volume          :decimal(9, 3)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_components_on_combination_id   (combination_id)
#  index_components_on_raw_material_id  (raw_material_id)
#
# Foreign Keys
#
#  fk_rails_3a5a0c1867  (combination_id => combinations.id)
#  fk_rails_c4359da279  (raw_material_id => raw_materials.id)
#

class Component < ApplicationRecord
  belongs_to :combination
  belongs_to :raw_material

  has_paper_trail

  validates :raw_material_id, presence: true
  validates :volume, numericality: true

  delegate :to_s, to: :raw_material
end
