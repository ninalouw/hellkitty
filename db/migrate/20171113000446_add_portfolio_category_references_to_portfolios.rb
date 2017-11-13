class AddPortfolioCategoryReferencesToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_reference :portfolios, :portfolio_category, foreign_key: true
  end
end
