class Client < ActiveRecord::Base
	has_many :receipts , dependent: :destroy

	public def personas_mas_facturadas (people_limit)
		datos = receipts.group(:person_id).select('person_id, SUM(total_amount) as amount').limit(people_limit).order('amount desc')

    	datos.map do |elem|
			{ 
				"name": 	Person.find(elem.person_id).name,  
				"amount": 	elem.amount 
			}
    	end


	end 
end
