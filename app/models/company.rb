# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

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

  validates :name, :license, presence: true

  def to_s
    name
  end
end
