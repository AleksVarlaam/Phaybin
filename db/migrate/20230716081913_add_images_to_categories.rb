class AddImagesToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :images, :json
  end
end
