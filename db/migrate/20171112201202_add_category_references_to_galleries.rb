class AddCategoryReferencesToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_reference :galleries, :category, foreign_key: true
  end
end
