class UserHistoryRecord < ActiveRecord::Base

	# Relations
	belongs_to :user

	# Validators
	validates :user_id, :presence => true
	validates :arrival, :presence => true

end
