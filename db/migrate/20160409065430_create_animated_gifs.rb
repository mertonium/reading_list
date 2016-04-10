class CreateAnimatedGifs < ActiveRecord::Migration
  def change
    create_table :animated_gifs do |t|
      t.string :url
      t.string :alt

      t.timestamps null: false
    end
  end
end
