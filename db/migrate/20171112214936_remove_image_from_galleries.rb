class RemoveImageFromGalleries < ActiveRecord::Migration[5.0]
  def change
    remove_column :galleries, :image, :string
  end
end
