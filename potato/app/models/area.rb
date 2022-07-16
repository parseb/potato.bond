class Area < ApplicationRecord
    has_many :consumers, primary_key: "area_id", foreign_key: "area_id"
    has_many :farmers, primary_key: "area_id", foreign_key: "area_id"
    has_many :baskets, primary_key: "area_id", foreign_key: "area_id"
end
