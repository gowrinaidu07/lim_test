class CreateWebSites < ActiveRecord::Migration
  def change
    create_table :web_sites do |t|
      t.string :url
      t.text :h1, array: true, default: []
      t.text :h2, array: true, default: []
      t.text :h3, array: true, default: []
      t.text :links, array: true, default: []
      t.timestamps null: false
    end
  end
end
