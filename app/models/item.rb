class Item < ActiveRecord::Base
  attr_accessible :title, :cost, :description

  validates :title, :presence => true,
                    :length => { :minimum => 3 }
end
