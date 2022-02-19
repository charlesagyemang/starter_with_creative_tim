class Loaner < ApplicationRecord
    has_many :loans
    has_one_attached :id_card
end
