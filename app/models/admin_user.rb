# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class AdminUser < ApplicationRecord
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

  validates :email, presence: true,
                    uniqueness: { if: :email_changed? },
                    format: { with: email_regexp, if: :email_changed? }

  has_paper_trail

  def to_s
    email
  end
end
