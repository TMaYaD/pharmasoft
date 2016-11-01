# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  license    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
  has_paper_trail

  validates :name, presence: true
  validates :license, presence: true

  def to_s
    name
  end
end
