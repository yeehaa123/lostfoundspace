class AddAndChangeFieldsToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :subtitle, :string
    change_column :slides, :content, :text
  end
end
