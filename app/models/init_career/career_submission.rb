module InitCareer
  class CareerSubmission < ApplicationRecord
    belongs_to :career, class_name: "Career", foreign_key: "career_id", optional: true

     validates :name,:email,:phone,presence: true
  end
end
