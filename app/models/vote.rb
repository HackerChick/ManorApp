class Vote < ActiveRecord::Base
  belongs_to :unit
  belongs_to :item

  # choice (allow null so can do find_or_create)
end
