class Receipt < ActiveRecord::Base
  belongs_to :client
  belongs_to :person

  validates :person_id, :client_id, :description, :total_amount, :emission_date, presence: true
  
  validates :person_id, :client_id, numericality: { only_integer: true }
  validates :total_amount, numericality: true
  
end
