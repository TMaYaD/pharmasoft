class Batch < ApplicationRecord
  belongs_to :combination
  has_many :overages, dependent: :destroy

  accepts_nested_attributes_for :overages, allow_destroy: true
end
