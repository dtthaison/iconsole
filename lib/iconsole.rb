require 'iconsole/version'
require 'iconsole/configuration'
require 'awesome_print'

module Iconsole
  class Engine < ::Rails::Engine
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
