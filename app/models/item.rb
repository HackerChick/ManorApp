class Item < ActiveRecord::Base
  attr_accessible :title, :cost, :description
  has_many :votes, :include => :unit, :order => 'units.number', :dependent => :delete_all
  has_many :comments, :order => 'comments.datetime'

  validates :title, :presence => true
end
