# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

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
#  fk_rails_334aa08429  (component_id => components.id)
#  fk_rails_c1d67d4627  (batch_id => batches.id)
#

class BatchInput < ApplicationRecord
  belongs_to :component
  belongs_to :batch
  has_many :raw_material_usages
  has_one :raw_material, through: :component

  has_paper_trail

  validate :required_raw_material_is_available

  before_create :build_raw_material_usage
  before_update :build_raw_material_usage_for_overage

  def base_volume
    component.volume * batch.size_multiplier
  end

  # delegate :raw_material, to: :component

  def total_volume
    @total_volume ||= base_volume + overage
  end

  def to_s
    "#{component} (##{batch.code})"
  end

  private

  def required_raw_material_is_available
    if overage_was == nil then
      available_quantity = available_batches.sum(:available_quantity_cache)
      errors.add :base, "Only #{available_quantity} of #{total_volume} is available." if total_volume > available_quantity
    else
      available_quantity = available_batches.sum(:available_quantity_cache)
      errors.add :base, "Only #{available_quantity} of #{overage - overage_was} is available." if overage - overage_was > available_quantity
    end
  end


  def build_raw_material_usage
    required_quantity = total_volume

    available_batches.each do |rmb|
      q = [required_quantity, rmb.available_quantity_cache].min
      required_quantity -= q
      raw_material_usages.build raw_material_batch: rmb,
                                description:        "Batch ##{batch.code}",
                                quantity:           q,
                                used_on:            batch.created_at
      break if required_quantity.zero?
    end
  end

def build_raw_material_usage_for_overage
  required_quantity = overage - overage_was

  if required_quantity > 0 then
    available_batches.each do |rmb|
      q = [required_quantity, rmb.available_quantity_cache].min
      required_quantity -= q
      raw_material_usages.build raw_material_batch: rmb,
                                description: "Batch overage ##{batch.code}",
                                quantity: q,
                                used_on: batch.created_at
     break if required_quantity == 0
   end
 else
   raw_material_usages.build raw_material_batch: last_used_batch,
                             description: "Batch overage returned ##{batch.code}",
                             quantity: required_quantity,
                             used_on: batch.created_at
  end

end


  def available_batches
    @available_batches ||= raw_material.raw_material_batches
                                       .where('available_quantity_cache > 0')
                                       .order(expiry_on: :asc)
  end

  def last_used_batch
    @last_used_batch ||= raw_material.raw_material_batches
                                       .order("updated_at").last
  end
end
