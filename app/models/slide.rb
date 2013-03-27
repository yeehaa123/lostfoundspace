class Slide < ActiveRecord::Base
  attr_accessible :content, :title, :subtitle, :image_url

  validates_presence_of  :title, :subtitle
end
