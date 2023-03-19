class Membership < ApplicationRecord
  validates :client_id,
            uniqueness: {
              scope: :gym_id,
              message: 'This client already has a membership at this gym.',
            }
  belongs_to :gym
  belongs_to :client
end
