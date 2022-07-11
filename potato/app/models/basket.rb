class Basket < ApplicationRecord

    belongs_to :area, primary_key: "area_id", foreign_key: "area_id"

end
