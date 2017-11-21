class Gallery < ApplicationRecord
  validates :title, presence: true, length: { minimum: 7 }
  validates :body, presence: true
  validates :image, presence: true
  belongs_to :user
  belongs_to :category

  # has_attached_file :image, styles: { small: "100x100", med: "200x200", large: "400x400" }, default_url: "/images/:style/gallery-1.jpg"
  has_attached_file :image,
    :styles => {
      :thumb  =>  "100x100",
      :medium => "200x200",
      :large => "400x400"
    },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/app_keys.rb",
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'hellkittyappdev'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
  validates :image, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :image
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes

  def user_full_name
    if user
      user.first_name + ' ' + user.last_name
    else
      'Anonymous'
    end
  end
end
