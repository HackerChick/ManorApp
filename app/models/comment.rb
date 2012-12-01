class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :text, :presence => true

end
