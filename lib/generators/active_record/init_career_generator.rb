# frozen_string_literal: true

require 'rails/generators/active_record'
require 'generators/init_career/orm_helpers'

module ActiveRecord
	module Generators
	  class InitCareerGenerator < ActiveRecord::Generators::Base

	    include InitCareer::Generators::OrmHelpers

	    source_root File.expand_path("../templates", __FILE__)

	    def copy_devise_migration
	        migration_template "career_migration.rb", "#{migration_path}/create_#{table_name}.rb", migration_version: migration_version
	        migration_template "career_submission_migration.rb", "#{migration_path}/create_#{table_name.singularize}_submissions.rb", migration_version: migration_version
	    end

		# def generate_model
  #       	invoke "active_record:model", [name], migration: false unless model_exists? && behavior == :invoke
  #     	end  

    def career_migration_data
<<RUBY
t.string :title
      t.string :position
      t.string :location
      t.text :description
      t.text :questions
      t.boolean :status,default: true

RUBY
    end

    def career_submission_migration_data
<<RUBY
t.references :#{table_name.singularize}, foreign_key: true
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

RUBY
    end

	  end

	end
end