class <%= ActiveSupport::Inflector.camelize(singular_name.to_s) %> < ApplicationRecord
	validates :title,:position,presence: true

	scope :active, -> { where(status: true) }

	serialize :questions
	has_many :<%= singular_name.to_s %>_submissions, dependent: :destroy
end
