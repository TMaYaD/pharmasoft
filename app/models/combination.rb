# == Schema Information
#
# Table name: combinations
#
#  id           :integer          not null, primary key
#  name         :string
#  form         :string
#  release_mode :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Combination < ApplicationRecord
  enum form: [:tablet, :capsule, :ointment, :liquid_oral, :powder]

  has_many :components, dependent: :destroy
  has_many :raw_materials, through: :components

  has_paper_trail

  accepts_nested_attributes_for :components, allow_destroy: true

  def standard_size
    STANDARD_SIZES[form.to_sym]
  end

  def to_s
    name
  end

  STANDARD_SIZES = {
    tablet: 1_00_000,
    capsule: 1_00_000,
    ointment: 60,
    liquid_oral: 500,
    powder: 500
  }.freeze
end
