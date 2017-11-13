class Portfolio < ApplicationRecord
  validates :title, presence: true, length: { minimum: 7 }
  validates :body, presence: true
  belongs_to :user
  belongs_to :portfolio_category

  def user_full_name
    if user
      user.first_name + ' ' + user.last_name
    else
      'Anonymous'
    end
  end
end
