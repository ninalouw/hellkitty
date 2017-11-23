class Gallery < ApplicationRecord
  validates :title, presence: true, length: { minimum: 7 }
  validates :body, presence: true
  validates :image, presence: true
  belongs_to :user
  belongs_to :category

  has_attached_file :image, styles: { small: "100x100", med: "200x200", large: "400x400" }, default_url:"/images/:style/missing.png", :s3_protocol => :https


  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def user_full_name
    if user
      user.first_name + ' ' + user.last_name
    else
      'Anonymous'
    end
  end
end
