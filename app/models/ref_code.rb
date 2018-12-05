class RefCode < ApplicationRecord

    def self.create_new_ref_code
    	ref_code = SecureRandom.hex(10)
    	rc = RefCode.find_by(ref_code: ref_code)
    	while !rc.blank?
    		ref_code = SecureRandom.hex(10)
    		rc = RefCode.find_by(ref_code: ref_code)
    	end
    	return ref_code
    end


end
