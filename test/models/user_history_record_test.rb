require 'test_helper'

class UserHistoryRecordTest < ActiveSupport::TestCase

  test "save record" do
		new_record = UserHistoryRecord.new
		new_record.uuid = "1"
		new_record.arrival = "2015-11-30 12:00:00 PM"
		new_record.on_time = true
		assert new_record.save
	end

	test "missing uuid" do
		new_record = UserHistoryRecord.new
		new_record.arrival = "2015-11-30 12:00:00 PM"
		new_record.on_time = true
		assert new_record.save == false
	end

	test "missing arrival" do
		new_record = UserHistoryRecord.new
		new_record.uuid = "1"
		new_record.on_time = true
		assert new_record.save == false
	end

end
