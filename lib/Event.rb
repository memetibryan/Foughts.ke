class Event < ActiveRecord::Base
	belongs_to(:host)
end