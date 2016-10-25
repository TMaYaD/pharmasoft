class Product < ApplicationRecord
  belongs_to :combination
  belongs_to :manufactured_by, class_name: 'Product'
  belongs_to :marketed_by, class_name: 'Product'
end
