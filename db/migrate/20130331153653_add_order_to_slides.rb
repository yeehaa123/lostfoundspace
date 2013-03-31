class AddOrderToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :main_order, :integer
    add_column :slides, :sub_order, :integer
  end
end
