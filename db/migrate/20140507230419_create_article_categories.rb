class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.integer :category_id
      t.integer :article_id
      t.timestamps
    end
    add_index :article_categories, :category_id
    add_index :article_categories, :article_id
  end
end
