class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to application_path(@application)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def application_params
    params.require(:application).permit(:company_name, :job_title, :status)
  end

end
