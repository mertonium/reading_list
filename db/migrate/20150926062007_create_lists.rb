class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :subject
      t.text :body
      t.integer :state
      t.datetime :sent_at

      t.timestamps null: false
    end
  end
end
