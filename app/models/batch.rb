# == Schema Information
#
# Table name: batches
#
#  id              :integer          not null, primary key
#  combination_id  :integer
#  code            :string
#  size            :integer
#  yield           :decimal(9, 3)
#  manufactured_on :date
#  expiry_on       :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_batches_on_combination_id  (combination_id)
#
# Foreign Keys
#
#  fk_rails_edebebe209  (combination_id => combinations.id)
#

class Batch < ApplicationRecord
  belongs_to :combination
  has_many :overages, dependent: :destroy
  has_many :raw_materials, through: :overages
  has_many :product_batches, dependent: :destroy, :before_add => :set_nest

  has_paper_trail

  accepts_nested_attributes_for :overages, allow_destroy: true
  accepts_nested_attributes_for :product_batches, allow_destroy: true

  validates :combination_id, :code, :size, presence: true
  validates_date :manufactured_on
  validates_date :expiry_on, :after => :manufactured_on


  before_create :create_overages

  def input_volume
    overages.sum(&:total_volume)
  end

  def to_s
    "##{code} (#{combination})"
  end

  def size_multiplier
     size / combination.standard_size
  end

  def unused_volume
     size - product_batches.sum(:size)
  end

  private

  def set_nest(product_batch)
    product_batch.batch ||= self
  end

  def create_overages
    combination.components.each do |c|
      overages.build component: c, volume: 0
    end
  end
end
