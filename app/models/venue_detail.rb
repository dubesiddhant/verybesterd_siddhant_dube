class VenueDetail < ApplicationRecord
  # Direct associations

  has_many   :bookmarked_venues,
             :foreign_key => "venue_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
