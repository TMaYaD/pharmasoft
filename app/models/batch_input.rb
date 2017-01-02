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
  has_many :raw_material_usages
  has_one :raw_material, through: :component

  has_paper_trail

  validate :required_raw_material_is_available

  before_create :build_raw_material_usage

  def base_volume
    component.volume * batch.size_multiplier
  end

  #delegate :raw_material, to: :component

  def total_volume
    @total_volume ||= base_volume + overage
  end

  def to_s
    "#{component} (##{batch.code})"
  end

  private

  def required_raw_material_is_available
    available_quantity = available_batches.sum(:available_quantity_cache)
    errors.add :base, "Only #{available_quantity} of #{total_volume} is available." if total_volume > available_quantity
  end

  def build_raw_material_usage
    required_quantity = total_volume

    available_batches.each do |rmb|
      q = [required_quantity, rmb.available_quantity_cache].min
      required_quantity -= q
      raw_material_usages.build raw_material_batch: rmb,
                                description: "Batch ##{batch.code}",
                                quantity: q,
                                used_on: batch.created_at
      break if required_quantity == 0

    end
  end

  def available_batches
    @available_batches ||= raw_material.raw_material_batches
                                       .where("available_quantity_cache > 0")
                                       .order(expiry_on: :asc)
  end
end
