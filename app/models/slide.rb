class Slide < ActiveRecord::Base
  attr_accessible :content, :title, :subtitle, :image_url, :main_order, :sub_order

  validates_presence_of  :title, :subtitle, :main_order, :sub_order
end
