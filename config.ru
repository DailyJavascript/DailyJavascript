# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::Cors do
	allow do
		origins "https://goofy-ride-78f323.netlify.com"
		resource "*", headers: :any, methods: [:get, :post, :options, :put, :patch, :delete]
	end
end