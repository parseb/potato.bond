class Area < ApplicationRecord
    #after_create :increment_g
    
    # has_many :consumers, primary_key: "area_id", foreign_key: "area_id"
    # has_many :farmers, primary_key: "area_id", foreign_key: "area_id"
    # has_many :baskets, primary_key: "area_id", foreign_key: "area_id"

    # def increment_g
    #     g= GlobalState.last
    #     g.gid = (GlobalState.count + 1).to_s
    #     g.save!
    # end

end
