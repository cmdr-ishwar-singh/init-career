# frozen_string_literal: true

class Create<%= "#{table_name.singularize.camelize}Submissions" %> < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :<%= "#{table_name.singularize}_submissions" %> do |t|
      <%= career_submission_migration_data -%>
      t.timestamps null: false
    end
  end
end
