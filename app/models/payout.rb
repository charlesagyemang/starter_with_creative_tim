class Payout < ApplicationRecord
  belongs_to :investor
  belongs_to :contribution
end
