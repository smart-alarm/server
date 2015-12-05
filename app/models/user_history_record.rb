class UserHistoryRecord < ActiveRecord::Base


	# Validators
	validates :uuid, :presence => true
	validates :arrival, :presence => true

end
