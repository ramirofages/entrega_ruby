require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  
setup do

    @client_with_normal_info = Client.new do |c|
    	c.first_name="asd"
    	c.last_name="asd"
    	c.birth_date= Date.today
    	c.cuit=1
    	c.document_number=1
    	c.gender="m"
    	c.email="asd@asd.com"
    	c.phone_number="123"
    	c.skype="asd@skype.com"
    end

    @client_without_contact_info = Client.new do |c|
    	c.first_name="asd"
    	c.last_name="asd"
    	c.birth_date= Date.today
    	c.cuit=1
    	c.document_number=1
    	c.gender="m"
    end

     @client_with_invalid_info = Client.new do |c|
    	c.first_name=123123
    	c.last_name="asd"
    	c.birth_date= Date.today
    	c.cuit=1
    	c.document_number=1
    	c.gender="m"
    	c.email="asd@asd.com"
    	c.phone_number="123"
    	c.skype="asd@skype.com"
    end
end


	test "should not create client without contact info" do
		
		assert_no_difference('Client.count') do
			@client_without_contact_info.save
		end

	end

	test "should create client" do
		
		assert_difference('Client.count') do
			@client_with_normal_info.save
		end
	end

	test "should not create client with invalid info" do
		
		assert_no_difference('Client.count') do
			@client_with_invalid_info.save
		end

	end
end
