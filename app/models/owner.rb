class Owner < ApplicationRecord
    has_many :pets

    def full_name
        self.first_name + " " + self.last_name
    end

    def self.find_or_create_with_oauth(auth)
        # first_or_initialize doesn't persist
        where(uid: auth.uid).first_or_initialize.tap do |o|
            # byebug
            o.first_name = auth.info.name.split(" ").first
            o.last_name = auth.info.name.split(" ").last
            o.email = auth.info.email
            o.uid = auth.uid
            o.provider = auth.provider
            o.save!
        end
    end
end
