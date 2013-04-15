class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
