class Recruiter < ActiveRecord::Base
	has_many :applicant

  def rate
    apps = self.applicant
    accepted = 0
    responded = 0
    apps.each do |app, key|
      if app.statuses.last.id == 1
        puts 'no'
        responded = responded + 1
      elsif app.statuses.last.id == 5
        puts 'yes'
        accepted = accepted + 1
      end
    end
    (accepted.to_f / (accepted.to_f + responded.to_f)) * 100
  end
end
