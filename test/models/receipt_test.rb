require 'test_helper'

class ReceiptTest < ActiveSupport::TestCase
  


setup do

    @receipt_normal = Receipt.new do |r|
    	r.client_id=Client.take.id
    	r.person_id=Person.take.id
    	r.description="asd"
    	r.emission_date= Date.today
    	r.total_amount=1
    end

    @receipt_invalid = Receipt.new 

end


  test "should create receipt" do
    assert_difference('Receipt.count') do
     	@receipt_normal.save
    end
  end

  test "should not create invalid receipt" do
    assert_no_difference('Receipt.count') do
     	@receipt_invalid.save
    end
  end

end
