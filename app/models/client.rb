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

	public def total_revenue_by_year

		datos = receipts.group_by{|receipt| receipt.emission_date.year}

		# perdi una tarde entera buscando la forma de hacer el group by
		# por año y despues una suma del monto usando los metodos de active record, pero no 
		# lo pude lograr, asique termine haciendo la suma manualmente.
		# Retornamos un arreglo del tipo [ {"year": 2014 ,"amount": 50}], {...}]
		datos.map do |year,receipts| 
			{ 
				year: year, 
				amount: receipts.inject(0) do |sum, receipt| 
				  	sum + receipt.total_amount
				end 
			}
		end
	end

	public def receipts_amount_by_month(from_starting_date)
		receipts.where(:emission_date => from_starting_date..Date.today).count



	end 
end
