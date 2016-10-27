class Overage < ApplicationRecord
  belongs_to :component
  belongs_to :batch

  def base_volume
    component.volume * batch.size / batch.combination.standard_size
  end

  delegate :raw_material, to: :component
end
