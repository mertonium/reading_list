class AddAnimatedGifIdToList < ActiveRecord::Migration
  def change
    add_reference :lists, :animated_gif, index: true, foreign_key: { on_delete: :nullify }
  end
end
