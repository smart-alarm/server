require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	test "save user" do
		new_user = User.new
		new_user.email = 'test@test.com'
		new_user.password = 'password'
		new_user.password_confirmation = 'password'
		assert new_user.save
	end

	test "nonmatching password" do
		new_user = User.new
		new_user.email = 'test@test.com'
		new_user.password = 'password'
		new_user.password_confirmation = "abc123"
		assert new_user.save == false
	end

	test "same email" do
		first_user = User.new
		first_user.email = "same@same.com"
		first_user.password = "password"
		first_user.password_confirmation = "password"
		assert first_user.save

		second_user = User.new
		second_user.email = "same@same.com"
		second_user.password = "abc123"
		second_user.password_confirmation = "abc123"
		assert second_user.save == false
	end
 
end
