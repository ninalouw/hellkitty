class PortfolioCategory < ApplicationRecord
    validates :title, presence: true
    has_many :portfolios, dependent: :nullify
end
