require 'rails/generators/base'

module InitCareer
  module Generators
    class ControllersGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates/controllers", __FILE__)      
      argument :scope, required: false,default: "career",
        desc: "The scope to create controllers in, e.g. users, admins"
			 
        def create_controllers
	      template "careers_controller.rb",
                   "app/controllers/#{plural_scope}_controller.rb"
	    end

	    protected

     	def plural_scope
      	  @plural_scope ||= scope.presence && scope.underscore.pluralize
        end

	    def prefix_scope
	      @scope_prefix = scope.blank? ? '' : (scope.singularize)
	      return  ActiveSupport::Inflector.camelize(@scope_prefix)
	    end

    end
  end
end
