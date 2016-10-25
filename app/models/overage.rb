class Overage < ApplicationRecord
  belongs_to :component
  belongs_to :batch
end
