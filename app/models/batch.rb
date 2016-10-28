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

  has_paper_trail

  accepts_nested_attributes_for :overages, allow_destroy: true

  before_create :create_overages

  def input_volume
    overages.sum(&:total_volume)
  end

  def to_s
    "##{code} (#{combination})"
  end

  private

  def create_overages
    combination.components.each do |c|
      overages.build component: c, volume: 0
    end
  end
end
