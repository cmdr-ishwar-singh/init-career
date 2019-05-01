# frozen_string_literal: true

require 'rails/generators/named_base'

module InitCareer
  module Generators
    class InitCareerGenerator < Rails::Generators::NamedBase
      puts "=================> init InitCareer model"

      namespace "init_career"

      source_root File.expand_path("../../templates", __FILE__)
      
      def copy_initializer
        template "career.rb", "#{target_path}/#{singular_name}.rb"
        template "career_submission.rb", "#{target_path}/#{singular_name}_submission.rb"
      end

      hook_for :orm

      def add_devise_routes

        # backend routes
        route "resources :#{plural_name}".dup

        route "get '/#{singular_name}/:id/submissions' , to: '#{plural_name}#submissions' , as: 'submissions_list'".dup

        route "get '/submission/:#{singular_name}_submission_id' , to: '#{plural_name}#submission_detail' , as: 'submission_detail'".dup
        route "get '/#{singular_name}_question' , to: '#{plural_name}#career_question' , as: '#{singular_name}_question'".dup

        # outer routes
        route "get '/#{plural_name}_list' , to: '#{plural_name}#careers_list' , as: '#{plural_name}_list'".dup
        route "get '/#{singular_name}/apply/:id' , to: '#{plural_name}#career_apply' , as: '#{singular_name}_apply'".dup

        route "post '/#{singular_name}/apply/:id' , to: '#{plural_name}##{singular_name}_submission' , as: '#{singular_name}_submission'".dup

      end

      protected
      # target path for your application
      def target_path
        @target_path ||= "app/models/"
      end

    end
  end
end