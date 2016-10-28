class Component < ApplicationRecord
  belongs_to :combination
  belongs_to :raw_material
end
