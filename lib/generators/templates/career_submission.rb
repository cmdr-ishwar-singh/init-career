class <%= ActiveSupport::Inflector.camelize("#{singular_name.to_s}#{"Submission"}") %> < ApplicationRecord
	 validates :name,:email,:phone,presence: true
	 belongs_to :<%= singular_name.to_s %> ,optional: true
end
