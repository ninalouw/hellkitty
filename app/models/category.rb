class Category < ApplicationRecord
    validates :title, presence: true
    has_many :galleries, dependent: :nullify
end
