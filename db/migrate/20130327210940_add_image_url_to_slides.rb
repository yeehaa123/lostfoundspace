class AddImageUrlToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :image_url, :string
  end
end
