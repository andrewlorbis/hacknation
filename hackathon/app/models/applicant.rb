class Applicant < ActiveRecord::Base
	has_one :recruter
	has_one :status
	has_one :position
	has_many :languages
end
