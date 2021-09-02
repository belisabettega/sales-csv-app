require 'csv'

class DataFilesController < ApplicationController
  def new
    @data_file = DataFile.new
    @last_file_income = DataFile.all.last&.income || 0
    @all_income = calculate_income
  end

  def create
    data_file = DataFile.create(income: 0)
    import(params[:data_file][:file], data_file)
    redirect_to root_path
  end

  private

  def calculate_income
    total_income = 0
    DataFile.all.each do |income_file|
      total_income += income_file.income if income_file.income
    end
    total_income
  end

  def import(file, instance_of_file_obj)
    CSV.foreach(file, headers: :first_row, col_sep: "\t") do |row|
      purchase = generate_purchase_and_model_entities(row, instance_of_file_obj)
      instance_of_file_obj.income += (purchase.product.price * purchase.product_quantity)
      instance_of_file_obj.save
    end
  end

  def generate_purchase_and_model_entities(row, instance_of_file_obj)
    merchant = Merchant.find_or_create_by(name: row['merchant name'], address: row['merchant address'])
    purchaser = Purchaser.find_or_create_by(name: row['purchaser name'])
    product = Product.find_or_create_by(description: row['item description'], price: row['item price'])
    product_quantity = row['purchase count']
    Purchase.create(merchant: merchant, data_file: instance_of_file_obj, purchaser: purchaser,
                    product_quantity: product_quantity, product: product)
  end
end
