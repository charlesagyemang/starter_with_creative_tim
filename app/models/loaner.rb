class Loaner < ApplicationRecord
    has_many :loans
    has_one_attached :id_card

    def full_name
        "#{first_name} #{last_name}"
    end
end
