class Receipt < ActiveRecord::Base
  belongs_to :client
  belongs_to :person

  validates :person_id, :client_id, :description, :total_amount, :emission_date, presence: true
  
  # /[0-9]*/ esta expresion regular deberia permitir solo numeros...
  validates :total_amount, :person_id, :client_id, format: { with: /[0-9]*/, message: "only allows numbers"  }
  
end
