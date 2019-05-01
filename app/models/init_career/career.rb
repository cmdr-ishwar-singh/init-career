module InitCareer
  class Career < ApplicationRecord
  	validates :title,:position,presence: true

  	scope :active, -> { where(status: true) }

	serialize :questions
	has_many :career_submissions, dependent: :destroy

  end
end
