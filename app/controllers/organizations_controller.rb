class OrganizationsController < ApplicationController
  # Devise authentication exceptions for the following pages:
  # skip_before_action :authenticate_user!, only: [:index, :show]

  # Devise: whitelist all pages for testing
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # Shows all organizations
  def index
    @organizations = Organization.all
  end

  # Shows all the information for one organization
  def show
    @organization = Organization.find(params[:id])
  end

  # To add a new course organization
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
  end

  # To edit an organization
  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    @organization.update(organization_params)
    redirect_to organization_path
  end

  # To delete an organization
  def destroy
    @organization = Organization.find(params[:id])
    @organization.delete
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description)
  end
end
