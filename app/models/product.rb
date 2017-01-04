# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  manufactured_by_id :integer
#  marketed_by_id     :integer
#  combination_id     :integer
#  packaging_type     :integer
#  size               :string
#  primany_packing    :string
#  secondary_packing  :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_products_on_combination_id      (combination_id)
#  index_products_on_manufactured_by_id  (manufactured_by_id)
#  index_products_on_marketed_by_id      (marketed_by_id)
#
# Foreign Keys
#
#  fk_rails_1df2897474  (marketed_by_id => companies.id)
#  fk_rails_7395ec4105  (manufactured_by_id => companies.id)
#  fk_rails_e58eb4ddc6  (combination_id => combinations.id)
#

class Product < ApplicationRecord
  enum packaging_type: [:alu_alu, :blister, :strip, :amber_bottle, :clear_bottle]
  PRIMARY_PACKAGINGS = [].freeze

  belongs_to :combination
  belongs_to :manufactured_by, class_name: 'Company'
  belongs_to :marketed_by, class_name: 'Company'

  has_paper_trail

  validates :name, presence: true
  validates :manufactured_by_id, presence: true
  validates :marketed_by_id, presence: true
  validates :combination_id, presence: true
  validates :packaging_type, presence: true
  validates :size, presence: true

  def to_s
    name
  end
end
