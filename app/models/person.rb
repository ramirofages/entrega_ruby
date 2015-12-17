class Person < ActiveRecord::Base
	has_many :receipts, dependent: :destroy

	validates :name, :cuit, presence: true
	validates :cuit, format: {with: /[0-9]+-[0-9]+-[0-9]+/ , message: "format needs to be x-x-x, with 'x' being any amount of numbers"}
end
