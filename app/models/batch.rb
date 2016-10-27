class Batch < ApplicationRecord
  belongs_to :combination
  has_many :overages, dependent: :destroy

  accepts_nested_attributes_for :overages, allow_destroy: true

  before_create :create_overages

  private

  def create_overages
    combination.components.each do |c|
      overages.build component: c, volume: 0
    end
  end
end
