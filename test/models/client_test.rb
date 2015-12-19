require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  
setup do

    @client_with_normal_info = Client.new do |c|
    	c.first_name="asd"
    	c.last_name="asd"
    	c.birth_date= Date.today
    	c.cuit="22-22-22"
    	c.document_number=1
    	c.gender="M"
    	c.email="asd@asd.com"
    	c.phone_number="123"
    	c.skype="asd@skype.com"
    end


    @client_without_contact_info = Client.new do |c|
    	c.first_name="asd"
    	c.last_name="asd"
    	c.birth_date= Date.today
    	c.cuit="22-22-22"
    	c.document_number=1
    	c.gender="M"
    end

     @client_with_invalid_info = Client.new do |c|
    	c.first_name=123123
    	c.last_name="asd"
    	c.birth_date= Date.today
    	c.cuit="22-22-22"
    	c.document_number=1
    	c.gender="F"
    	c.email="asd@asd.com"
    	c.phone_number="123"
    	c.skype="asd@skype.com"
    end

    @client_without_receipts = clients(:one)
    @client_with_receipts = clients(:with_receipts)

end


	test "should not create client without contact info" do
		

		assert_no_difference('Client.count') do
			@client_without_contact_info.save
		end

	end

	test "should create client" do
		
		assert_difference('Client.count') do
			@client_with_normal_info.save!
		end
	end

	test "should not create client with invalid info" do
		
		assert_no_difference('Client.count') do
			@client_with_invalid_info.save
		end
	end

    test "should delete client without receipts" do
        
        assert_difference('Client.count', -1) do
            @client_without_receipts.destroy
        end
    end

    test "should delete client with receipts along with his receipts" do

        #guardamos la cantidad de facturas que deberian quedar desp del borrado
        receipt_amount = Receipt.count -  @client_with_receipts.receipts.count

        assert_difference('Client.count', -1) do
            @client_with_receipts.destroy
        end

        assert_equal(receipt_amount, Receipt.count)
    end
end
