class Applicant < ActiveRecord::Base
	belongs_to :recruiter
	belongs_to :position
	has_and_belongs_to_many :statuses
	has_many :applicant_languages
	has_many :language, through: :applicant_languages

	def score
		gpa = self.gpa
		exp = self.exp
		language_count = self.language.count

		if exp < 1
			percent_exp = 10
		elsif exp < 2
			percent_exp = 20
		elsif exp < 3
			percent_exp = 30
		else
			percent_exp = 40
		end

		return (1 - (((gpa-1)/5)*0.01))*40 + percent_exp + (language_count/4)*20
	end
end
