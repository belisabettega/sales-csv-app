require 'csv'

class DataFilesController < ApplicationController
  def new
    @data_file = DataFile.new
  end
  def create
    data_file = DataFile.create
    import(params[:data_file][:file], data_file)
    redirect_to root_path
  end
 
  private
 
  def import(file, instance_of_file_obj)
    CSV.foreach(file, headers: :first_row, :col_sep => "\t") do |row|
      merchant = Merchant.create(name: row["merchant name"], address: row["merchant address"])
      purchaser = Purchaser.create(name: row["purchaser name"])
      product = Product.create(description: row["item description"], price: row["item price"])
      product_quantity = row["purchase count"]
      Purchase.create(merchant: merchant, purchaser: purchaser, data_file: instance_of_file_obj, product_quantity: product_quantity, product: product)
    end
  end
end
