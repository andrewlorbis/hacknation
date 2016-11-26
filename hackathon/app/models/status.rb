class Status < ActiveRecord::Base
	has_and_belongs_to_many :applicants

	def self.GetStatus(sid, date)
		# count = 0
		# for a in Status.find(sid).applicants
		# 	if a.updated_at.strftime("%Y-%m-%d") == date.strftime("%Y-%m-%d")
		# 		count++
		# 	end
		# end
		# return count
	end
end
