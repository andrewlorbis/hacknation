class ApplicantLanguage < ActiveRecord::Base
	belongs_to :applicant
	belongs_to :language 
end
