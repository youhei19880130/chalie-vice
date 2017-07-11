#-*- coding: utf-8 -*-
module Utils
  module Csv
    module PickingListCsvBuilder
      class PickingListRecord < BaseCsvBuilder::BaseRecord
        FIELDS = [
          [:order_code, "顧客番号"],
          [:receiver_name, "お名前"],
          [:jan_code, "商品コード"],
          [:item_name, "商品名"],
          [:count, "購入数量"],
          [:supplied_items, "同梱物"],
          [:remarks, "備考"],
          [:price, "価格"],
        ]
        define_field_attr_accessor
    
       def initialize
         @order_code = ''
         @receiver_name = ''
         @jan_code = ''
         @item_name = ''
         @count = ''
         @supplied_items = ''
         @remarks = ''
         @price = ''
       end
      end
    
      class PickingListCsvOutput < BaseCsvBuilder::BaseCsvOutput
        def output(lists)
          @records << PickingListRecord.header
          lists.map do |columns, count|
            record = PickingListRecord.new
            record.order_code = columns[0]
            record.receiver_name = columns[1]
            record.jan_code = columns[2]
            record.item_name = columns[3]
            record.count = count
            record.supplied_items = '納品書'
            record.remarks = columns[4]
            record.price = columns[5]
            @records << record.to_csv
          end
          @records.join("\n")
        end
      end
    end
  end
end
