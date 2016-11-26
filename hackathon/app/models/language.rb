class Language < ActiveRecord::Base
	has_many :applicant_languages
	has_many :applicant, through: :applicant_languages
end
