class Contribution < ApplicationRecord
    belongs_to :investor, foreign_key: "investors_id"
end
