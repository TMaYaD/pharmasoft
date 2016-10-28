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
  belongs_to :batch
  belongs_to :product

  has_paper_trail

  def to_s
    "##{batch.code} (#{product})"
  end
end
