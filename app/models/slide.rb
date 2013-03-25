class Slide < ActiveRecord::Base
  attr_accessible :content, :title, :subtitle

  validates_presence_of  :title, :subtitle
end
