class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :logo
      t.string :title
      t.text :content
      t.integer :region_id
      t.integer :category_id
      t.boolean :preview
      t.string :published_by
      t.string :publish_url

      t.timestamps
    end
  end
end
