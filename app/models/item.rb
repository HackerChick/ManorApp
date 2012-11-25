class Item < ActiveRecord::Base
  attr_accessible :title, :cost, :description
  has_many :votes, :include => :unit, :order => 'units.number'

  validates :title, :presence => true
end
