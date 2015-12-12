class Client < ActiveRecord::Base
	has_many :receipts , dependent: :destroy
end
