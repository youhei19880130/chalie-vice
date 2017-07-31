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
            item_name = case
                        when columns[4].present? && columns[5].present?
                          "#{columns[3]}(#{columns[5]}・#{columns[4]})"
                        when columns[4].present? && columns[5].blank?
                          "#{columns[3]}(#{columns[4]})"
                        when columns[4].blank? && columns[5].present?
                          "#{columns[3]}(#{columns[5]})"
                        else
                          columns[3]
                        end
            record.item_name = item_name
            record.count = count
            record.supplied_items = '納品書'
            record.remarks = columns[6]
            record.price = columns[7]
            @records << record.to_csv
          end
          @records.join("\n")
        end
      end
    end
  end
end
