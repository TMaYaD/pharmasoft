# == Schema Information
#
# Table name: overages
#
#  id           :integer          not null, primary key
#  component_id :integer
#  batch_id     :integer
#  volume       :decimal(9, 3)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_overages_on_batch_id      (batch_id)
#  index_overages_on_component_id  (component_id)
#
# Foreign Keys
#
#  fk_rails_334aa08429  (component_id => components.id)
#  fk_rails_c1d67d4627  (batch_id => batches.id)
#

class Overage < ApplicationRecord
  belongs_to :component
  belongs_to :batch
  has_one :raw_material, through: :component

  has_paper_trail

  def base_volume
    component.volume * batch.size / batch.combination.standard_size
  end

  delegate :raw_material, to: :component

  def total_volume
    base_volume + volume
  end

  def to_s
    "#{component} (##{batch.code})"
  end
end
