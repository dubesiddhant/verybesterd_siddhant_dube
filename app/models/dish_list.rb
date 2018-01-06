class DishList < ApplicationRecord
  # Direct associations

  has_many   :bookmarked_venues,
             :foreign_key => "dish_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
