class Applicant < ActiveRecord::Base
	belongs_to :recruiter
	belongs_to :status
	belongs_to :position
	has_many :applicant_languages
	has_many :language, through: :applicant_languages
end
