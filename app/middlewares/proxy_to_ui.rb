# frozen_string_literal: true

require 'rack-proxy'

class ProxyToUi < Rack::Proxy
  def initialize(app)
    @app = app
  end

  def call(env)
    original_host = env['HTTP_HOST']
    rewrite_env(env)
    if env['HTTP_HOST'] != original_host
      perform_request(env)
    else
      # just regular
      env['REMOTE_USER']
      @app.call(env)
    end
  end

  def rewrite_env(env)
    request = Rack::Request.new(env)
    if %r{^/api/.*}.match?(request.path) || %r{^/rails/.*}.match?(request.path)
      # do nothing
    else
      env['HTTP_HOST'] = 'localhost:8080'
    end
    env
  end
end
