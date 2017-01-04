# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

# == Schema Information
#
# Table name: raw_material_usages
#
#  id                    :integer          not null, primary key
#  raw_material_batch_id :integer
#  description           :string
#  quantity              :decimal(10, 3)
#  used_on               :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  batch_input_id        :integer
#
# Indexes
#
#  index_raw_material_usages_on_batch_input_id         (batch_input_id)
#  index_raw_material_usages_on_raw_material_batch_id  (raw_material_batch_id)
#
# Foreign Keys
#
#  fk_rails_63820149c1  (raw_material_batch_id => raw_material_batches.id)
#  fk_rails_ebae4ec73d  (batch_input_id => batch_inputs.id)
#

class RawMaterialUsage < ApplicationRecord
  belongs_to :raw_material_batch
  belongs_to :batch_input

  def after_initialize
    self.used_on ||= Date.today
  end

  has_paper_trail

  after_save do
    raw_material_batch.cache_available_quantity
    raw_material_batch.save
  end
end
