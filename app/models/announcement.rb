class Announcement < ApplicationRecord
  validates :title, presence: true, length: { minimum: 7 }
  validates :body, presence: true
end
