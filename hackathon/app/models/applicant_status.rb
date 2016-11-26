class ApplicantStatus < ActiveRecord::Base
	belongs_to :applicant
	belongs_to :status 
end
