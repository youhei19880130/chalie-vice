class Order < ApplicationRecord
  belongs_to :item, primary_key: :chalievice_item_id, foreign_key: :chalievice_item_id

  def self.import_order_csv(file)
    orders = []
    open(file.path, 'r:cp932:utf-8', undef: :replace) do |f|
      csv = CSV.new(f, :headers => :first_row)
      csv.each do |row|
        order = Hash[[row.headers, row.fields].transpose]
        orders << Order.new(order_code: order['注文番号'], branch_no: order['枝番'], chalievice_item_id: order['商品ID'], item_name: order['商品名'], receiver_zip_code: order['お届け先郵便番号'], receiver_address: order['お届け先住所'], receiver_name: order['お届け先名'], receiver_tel: order['お届け先電話'], remarks: order['備考'])
      end
    end
    Order.import(orders)
  end

  def self.updatable_attributes
    %w()
  end
end
