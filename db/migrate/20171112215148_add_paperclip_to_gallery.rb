class AddPaperclipToGallery < ActiveRecord::Migration[5.0]
  def change
    add_attachment :galleries, :image
  end
end
