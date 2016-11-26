class Status < ActiveRecord::Base
	has_and_belongs_to_many :applicants

	def self.get_count_day(sid, date)
    count = 0
		self.find(sid).applicants.each do |a|
			if a.updated_at.strftime("%Y-%m-%d") == date.days.ago.strftime("%Y-%m-%d")
				count = count + 1
			end
		end
		count
	end

  def self.get_count_month(sid, month)
    count = 0
    self.find(sid).applicants.each do |a|
			if a.updated_at.strftime("%Y-%m") == month.months.ago.strftime("%Y-%m")
				count = count + 1
			end
		end
		count
  end

end
