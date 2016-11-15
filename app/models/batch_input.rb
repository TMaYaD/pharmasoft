# == Schema Information
#
# Table name: batch_inputs
#
#  id           :integer          not null, primary key
#  component_id :integer
#  batch_id     :integer
#  overage      :decimal(9, 3)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_batch_inputs_on_batch_id      (batch_id)
#  index_batch_inputs_on_component_id  (component_id)
#
# Foreign Keys
#
#  fk_rails_7fa74f0baa  (component_id => components.id)
#  fk_rails_ec3e2d0a7e  (batch_id => batches.id)
#

class BatchInput < ApplicationRecord
  belongs_to :component
  belongs_to :batch
  belongs_to :raw_material_usage
  has_one :raw_material, through: :component

  has_paper_trail

  def base_volume
    component.volume * batch.size_multiplier
  end

  #delegate :raw_material, to: :component

  def total_volume
    base_volume + volume
  end

  def to_s
    "#{component} (##{batch.code})"
  end
end
