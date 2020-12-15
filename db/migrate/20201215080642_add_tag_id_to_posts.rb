class AddTagIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :tag_id, :string
  end
end
