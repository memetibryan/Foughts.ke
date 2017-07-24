class Event < ActiveRecord::Base
	belongs_to(:host)

	#Active Record Validations making sure the form is not submitted blank
	validates(:name, :presence => true)

	#changes the input to Title_Case
	before_save(:titlecase_name)

private

    define_method(:titlecase_name) do
      self.name = (name().titlecase())
    end
end