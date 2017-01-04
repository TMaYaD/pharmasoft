# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

# == Schema Information
#
# Table name: product_batches
#
#  id         :integer          not null, primary key
#  batch_id   :integer
#  product_id :integer
#  mrp        :decimal(6, 2)
#  input      :decimal(9, 2)
#  output     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  size       :integer
#
# Indexes
#
#  index_product_batches_on_batch_id    (batch_id)
#  index_product_batches_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_6bbaac8a27  (batch_id => batches.id)
#  fk_rails_82590315b2  (product_id => products.id)
#

class ProductBatch < ApplicationRecord
  belongs_to :batch, inverse_of: :product_batches
  belongs_to :product

  has_paper_trail

  validates :product_id, presence:  true,
                         inclusion: {
                           in: lambda do |record|
                             record.batch.combination.product_ids
                           end
                         }

  def to_s
    "##{batch.code} (#{product})"
  end
end
