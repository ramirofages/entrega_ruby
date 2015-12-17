class Client < ActiveRecord::Base
	has_many :receipts , dependent: :destroy

	# la informacion de contacto de skype y telefonica son opcionales, 
	# solo se require el email como info de contacto obligatoria
	validates :first_name, :last_name, :cuit, :birth_date, :email, :document_number, :gender, presence: true
	validates :first_name, :last_name, :gender, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters"  }

	validates :cuit, 		format: {with: /[0-9]+-[0-9]+-[0-9]+/ , message: "format needs to be x-x-x, with 'x' being any amount of numbers"}
	validates :email, 		email: true
	validates :birth_date, 	date: true
	validates :gender, 		format: { with: /[MF]/, message: "only allows M or F"  }

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

		# Retornamos un arreglo del tipo [ {"year": 2014 ,"amount": 50}, {...}]
		datos.map do |year,receipts| 
			{ 
				year: year, 
				amount: receipts.inject(0) do |sum, receipt| 
				  	sum + receipt.total_amount
				end 
			}
		end
	end

	public def receipts_amount_by_month
		datos = receipts.where(:emission_date => Date.new(Date.today.year,1,1)..Date.today)
						.order(:emission_date)
						.group_by{|receipt| receipt.emission_date.month}
											
		datos.map do |month,receipts| 
			{ 
				month: month, 
				amount: receipts.count
			}
		end
	end 
end
