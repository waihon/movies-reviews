class ImportDataController < ApplicationController
  def create
    job = ImportJob.new
    job.run
    redirect_to root_path, notice: "Data imported!"  
  end
end