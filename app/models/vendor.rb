# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :text
#  phone      :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vendor < ApplicationRecord
  has_paper_trail
end
