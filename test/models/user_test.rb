require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "a user should enter the first name last_name and profile filled" do
    user=User.new
    assert !user.save 
    assert !user.errors[:first_name].empty?    
    assert !user.errors[:last_name].empty?
    assert !user.errors[:profile_name].empty?
    puts user.errors[:first_name]
    puts user.errors[:last_name]
    puts user.errors[:profile_name]
  end

  test "a user profile should have unique profile name" do
	    user=User.new
	    user.profile_name="rahulsharma"	    
	    user.email="123@test.com"
	    user.first_name="Rahul1"
	    user.last_name="Sharma2"    
	    assert !user.save
	    puts user.errors[:profile_name]   
	    
   end 

   test "a user should have a profile name without spaces" do
         user=User.new

         user.profile_name=users(:data).profile_name
         assert !user.save                  
         assert !user.errors[:profile_name].include?('Must have only letters alphabets, numbers and underscores')
   end


end
