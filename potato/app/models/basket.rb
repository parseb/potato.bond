class Basket < ApplicationRecord
    after_create :increment_g
    # belongs_to :area, primary_key: "area_id", foreign_key: "area_id"

    def increment_g
        if self.id > GlobalState.last.gid.to_i
            g= GlobalState.last
            g.gid = self.id.to_s
            g.save!
        end
    end
end
