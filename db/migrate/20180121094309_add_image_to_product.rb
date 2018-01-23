class AddImageToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :image_file_link, :string
  end
end
