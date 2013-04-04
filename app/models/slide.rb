class Slide < ActiveRecord::Base
  attr_accessible :content, :title, :subtitle, :image_url, :main_order, 
                  :sub_order, :id, :created_at, :updated_at

  validates_presence_of  :title, :subtitle, :main_order, :sub_order
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |slide|
        csv << slide.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      slide = find_by_id(row["id"]) || new
      slide.attributes = row.to_hash.slice(*accessible_attributes)
      slide.save!
    end
  end
end
