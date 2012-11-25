class Unit < ActiveRecord::Base
  has_many :votes
  validates :number, :inclusion => { :in=>[1,2,3,4,5,6]} , :uniqueness => true
end
