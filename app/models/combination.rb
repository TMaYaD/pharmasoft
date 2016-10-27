class Combination < ApplicationRecord
  has_many :components, dependent: :destroy

  accepts_nested_attributes_for :components, allow_destroy: true

  def standard_size
    {
      tablet: 1_00_000,
      capsule: 1_00_000,
      syrup: 500,
      ointment: 60
    }[form.to_sym]
  end
end
