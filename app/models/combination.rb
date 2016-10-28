class Combination < ApplicationRecord
  enum form: [:tablet, :capsule, :ointment, :liquid_oral, :powder]

  has_many :components, dependent: :destroy

  accepts_nested_attributes_for :components, allow_destroy: true

  def standard_size
    {
      tablet: 1_00_000,
      capsule: 1_00_000,
      ointment: 60,
      liquid_oral: 500,
      powder: 500
    }[form.to_sym]
  end
end
