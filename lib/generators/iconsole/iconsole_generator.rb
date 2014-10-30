require 'rails/generators'

module Iconsole
  module Generators
    class IconsoleGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer_file
        copy_file 'iconsole.rb', 'config/initializers/iconsole.rb'
      end

      def add_devise_routes
        devise_route  = "mount Iconsole::Engine, at: '/'"
        route devise_route
      end
    end
  end
end
