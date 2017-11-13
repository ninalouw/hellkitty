class CreatePortfolioCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
