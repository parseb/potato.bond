class Farmer < ApplicationRecord
    #after_create :increment_g
    # belongs_to :area, primary_key: "area_id", foreign_key: "area_id"

    # def increment_g
    #     g= GlobalState.last
    #     g.gid = (GlobalState.count + 1).to_s
    #     g.save!
    # end

end
