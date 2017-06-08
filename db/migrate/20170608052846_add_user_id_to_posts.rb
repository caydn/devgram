class AddUserIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :user, foreign_key: {to_table: :users}
  end
end
