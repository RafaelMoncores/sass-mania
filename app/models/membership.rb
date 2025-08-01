class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :account

  validates :user_id, uniqueness: { scope: :account_id, message: "já é membro desta conta" }
  validates :role, presence: true
end
