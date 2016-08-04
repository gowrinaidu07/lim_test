module Api
	module V1
	  class BaseController < ApplicationController
	    resource_description do
	    	short 'API Documentation'
	      # api_version "1"
	    end
	  end
	end
end