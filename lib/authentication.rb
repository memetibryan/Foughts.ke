class Authentication < ActiveRecord::Base
	#Active Record Validations making sure the form is not submitted blank
	validates(:username, :presence => true)
end