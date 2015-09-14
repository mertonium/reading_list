class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :url
      t.datetime :published_at
      t.string :media_type
      t.text :blurb
      t.datetime :sent_at

      t.timestamps null: false
    end
  end
end
