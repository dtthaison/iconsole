require 'stringio'

class ConsoleController < ActionController::Base
  before_filter :authenticate
  layout false

  def index
    render 'iconsole/console', layout: false
  end

  def subscribe(event_name)
    ActiveSupport::Notifications.subscribe(event_name) do |*args|
      yield(*args) if block_given?
    end
  end

  def cmd
    @sql = []
    begin
      tmp_out = StringIO.new
      # redirect STDOUT
      $stdout = tmp_out

      object = eval(params[:command])
      ap = ::AwesomePrint::Inspector.new(html: true)
      response = ap.awesome(object)

      # restore default stdout
      $stdout = STDOUT

      tmp_out.rewind
      stdout = tmp_out.read

    rescue => ex
      response = "<pre>#{ex.message}"
    end

    response = stdout + '<br/>' + response unless stdout.blank?
    response = @sql.join("\n") + '<br/>' + response unless @sql.empty?
    response = '<pre>' + response + '</pre>'

    render text: response
  end

  protected

  def authenticate
    require 'digest/md5'

    authenticate_or_request_with_http_basic do |username, password|
      username == Iconsole::configuration.username && Digest::MD5.hexdigest(password) == Iconsole::configuration.md5_password
    end
  end
end
