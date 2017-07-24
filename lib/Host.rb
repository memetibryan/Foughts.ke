class Host < ActiveRecord::Base
	has_many(:events)
end