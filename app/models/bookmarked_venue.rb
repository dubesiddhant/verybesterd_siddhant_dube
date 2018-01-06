class BookmarkedVenue < ApplicationRecord
  # Direct associations

  belongs_to :dish,
             :class_name => "DishList"

  # Indirect associations

  # Validations

end
