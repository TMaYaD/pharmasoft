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
end
