# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

# == Schema Information
#
# Table name: admin_users
#
#  id                  :integer          not null, primary key
#  email               :string           default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :inet
#  last_sign_in_ip     :inet
#  failed_attempts     :integer          default(0), not null
#  locked_at           :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  role                :integer          default("guest")
#
# Indexes
#
#  index_admin_users_on_email  (email) UNIQUE
#

class AdminUser < ApplicationRecord
  enum role: [:guest, :admin, :store_manager, :production_manager, :quality_analyst, :purchase_manager, :sales_manager]

  devise :saml_authenticatable,
         # :database_authenticatable,
         # :confirmable,
         :lockable,
         # :omniauthable,
         # :recoverable,
         :rememberable,
         # :timeoutable,
         :trackable
  # :validatable

  extend Devise::Models::Validatable::ClassMethods

  validates :email, presence:   true,
                    uniqueness: { if: :email_changed? },
                    format:     { with: email_regexp, if: :email_changed? }

  has_paper_trail

  def to_s
    email
  end
end
