# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  manufactured_by_id :integer
#  marketed_by_id     :integer
#  combination_id     :integer
#  packaging_type     :string
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
#  fk_rails_1df2897474  (marketed_by_id => products.id)
#  fk_rails_7395ec4105  (manufactured_by_id => products.id)
#  fk_rails_e58eb4ddc6  (combination_id => combinations.id)
#

class Product < ApplicationRecord
  belongs_to :combination
  belongs_to :manufactured_by, class_name: 'Product'
  belongs_to :marketed_by, class_name: 'Product'

  has_paper_trail

  def to_s
    name
  end
end
