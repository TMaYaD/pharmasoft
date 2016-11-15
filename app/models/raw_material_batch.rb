# == Schema Information
#
# Table name: raw_material_batches
#
#  id                       :integer          not null, primary key
#  raw_material_id          :integer
#  vendor_id                :integer
#  quantity                 :decimal(8, 3)
#  available_quantity_cache :decimal(8, 3)
#  batch_no                 :string
#  manufactured_on          :date
#  expiry_on                :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_raw_material_batches_on_raw_material_id  (raw_material_id)
#  index_raw_material_batches_on_vendor_id        (vendor_id)
#
# Foreign Keys
#
#  fk_rails_0cec08d1da  (vendor_id => vendors.id)
#  fk_rails_69b8b019c5  (raw_material_id => raw_materials.id)
#

class RawMaterialBatch < ApplicationRecord
  belongs_to :raw_material
  belongs_to :vendor
  has_many :raw_material_usages

  validates :raw_material_id, :vendor_id, :quantity, :batch_no, presence: true
  validates_date :manufactured_on
  validates_date :expiry_on, :after => :manufactured_on
  has_paper_trail

end
