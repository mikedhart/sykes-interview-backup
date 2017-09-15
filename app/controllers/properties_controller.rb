class PropertiesController < ApplicationController
	def index
		Property.per_page = 10
		params[:page] = '1' if params[:page].blank?
		@properties = Property.paginate(page: params[:page])

		if params[:q].blank?
			params[:q] = {}
		else
		  @properties = @properties.location(params[:q][:location]) if params[:q][:location].present?
		  @properties = @properties.beds(params[:q][:beds]) if params[:q][:beds].present?
		  @properties = @properties.sleeps(params[:q][:sleeps]) if params[:q][:sleeps].present?
		  @properties = @properties.accepts_beds(params[:q][:accepts_beds]) if params[:q][:accepts_beds].present?
		  @properties = @properties.near_beach(params[:q][:near_beach]) if params[:q][:near_beach].present?
		end
	end

	def show
		@property = Property.find params[:id]
	end
end
