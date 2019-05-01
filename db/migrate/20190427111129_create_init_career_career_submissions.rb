class CreateInitCareerCareerSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :init_career_career_submissions do |t|
      t.bigint :career_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :current_company
      t.string :linkedin_url
      t.string :twitter_url
      t.string :github_url
      t.string :other_url
      t.string :gender
      t.string :veteran_status
      t.string :disability_status
      t.text :question_answers
      t.text :note
      t.text :status ,default: 0

      t.timestamps
    end
  end
end
