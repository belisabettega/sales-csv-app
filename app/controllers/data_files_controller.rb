require 'csv'

class DataFilesController < ApplicationController
  def new
    @data_file = DataFile.new
  end
  def create
    import(params[:data_file][:file])
    redirect_to root_path
  end
 
  private
 
  def import(file)
    CSV.foreach(file, headers: :first_row, :col_sep => "\t") do |row|
      puts row
    end
  end
end
