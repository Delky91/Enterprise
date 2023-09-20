class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job

  def new
    @job_application = @job.job_applications.new
  end

  def show
    @job_applications = @job.job_applications
  end

  def create
    @job_application = @job.job_applications.new(job_application_params)
    @job_application.user = current_user

    if @job_application.save
      # Envía una notificación al administrador aquí si es necesario
      flash[:notice] = 'Tu postulación ha sido enviada con éxito.'
      redirect_to @job
    else
      render 'new'
    end
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def job_application_params
    params.require(:job_application).permit(:message)
  end
end
