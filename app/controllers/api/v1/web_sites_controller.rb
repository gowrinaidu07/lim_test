module Api
  module V1
    class WebSitesController < BaseController
      before_action :find_web_site, only: [:show, :destroy]

      resource_description do
        short "API for managing web sites information"
      end

    	def_param_group :web_site do
        param :web_site, Hash, :required => true, :action_aware => true do
          param :url, String, "Web site url", :required => true        
        end
      end

    	api! "List of web sites"
      description 'Display list of web sites'
      def index
        @web_sites = WebSite.all
        render json: @web_sites
      end

      api! "Details of the web site"
      description 'Display web site details'
      def show        
        render json: @web_site
      end

      api :GET, "/url", "Pass the web site URL"
      param :url, String, :desc => "URL of the web site", :required => true
      def url
        params[:web_site] = {:url => params[:url]} 
        create        
      end

      api! "Create the web site record"
      param_group :web_site
      def create
        @web_site = WebSite.new(web_site_params)
        if @web_site.save
          render json: @web_site, status: :created, location: api_web_site_url(@web_site)
        else
          render json: @web_site.errors, status: :unprocessable_entity
        end
      end

      api :DELETE, "/web_sites/:id", "Delete the record of web site"
      description "Delete the record of web site"
      def destroy        
        @web_site.destroy
        head :no_content
      end

      private

      def find_web_site
        @web_site = WebSite.find_by_id(params[:id])
        if @web_site.nil?
          render json: {:message => "Web site not found"}, :status => :not_found
        end
      end

      def web_site_params
        params.require(:web_site).permit(:url)
      end

    end
  end
end
