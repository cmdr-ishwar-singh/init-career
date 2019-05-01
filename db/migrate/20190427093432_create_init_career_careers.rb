class CreateInitCareerCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :init_career_careers do |t|
      t.string :title
      t.string :position
      t.string :location
      t.text :description
      t.text :questions
      t.boolean :status,default: true

      t.timestamps
    end
  end
end
