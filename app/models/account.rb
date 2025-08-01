class Account < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :name, presence: true, uniqueness: true
  validates :subdomain, presence: true, uniqueness: { case_sensitive: false },
                        format: { with: /\A[a-z0-9](?:[a-z0-9\-]*[a-z0-9])?\z/i,
                                  message: "only allows letters, numbers, and hyphens, and cannot start or end with a hyphen" }
end
