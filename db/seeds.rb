# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Admin Accounts
User.create(email: "gig6", password: "cornelltech1", password_confirmation: "cornelltech1")
User.create(email: "ew453", password: "cornelltech2", password_confirmation: "cornelltech2")

# Seed On-time data
UserHistoryRecord.create(uuid: '1', arrival: '2015-11-30 12:00:00 PM', on_time: true)
UserHistoryRecord.create(uuid: '1', arrival: '2015-12-1 12:00:00 PM', on_time: true)
UserHistoryRecord.create(uuid: '1', arrival: '2015-12-1 12:00:00 PM', on_time: false)
UserHistoryRecord.create(uuid: '2', arrival: '2015-12-1 12:00:00 PM', on_time: true)
UserHistoryRecord.create(uuid: '2', arrival: '2015-12-1 12:30:00 PM', on_time: true)
UserHistoryRecord.create(uuid: '2', arrival: '2015-12-2 12:30:00 PM', on_time: true)
UserHistoryRecord.create(uuid: '2', arrival: '2015-12-4 12:30:00 PM', on_time: true)
UserHistoryRecord.create(uuid: '2', arrival: '2015-12-5 12:30:00 PM', on_time: false)
UserHistoryRecord.create(uuid: '3', arrival: '2015-12-2 12:30:00 PM', on_time: false)
UserHistoryRecord.create(uuid: '3', arrival: '2015-11-28 12:30:00 PM', on_time: false)
UserHistoryRecord.create(uuid: '3', arrival: '2015-11-29 12:30:00 PM', on_time: false)
UserHistoryRecord.create(uuid: '3', arrival: '2015-11-28 12:30:00 PM', on_time: true)