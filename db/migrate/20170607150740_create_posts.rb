class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :caption

      t.timestamps
    end
  end
end
