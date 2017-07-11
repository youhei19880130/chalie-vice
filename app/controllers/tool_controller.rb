class ToolController < ApplicationController
  def index
  end

  def order
    last_index = Order.last&.id || 0

    # import order
    logger.info('START: import orders')
    Order.import_order_csv(params[:file])
    logger.info('FINISH: import orders')

    # picking list
    logger.info('START: export picking list')
    picking_lists = Order.where('orders.id > ?', last_index).includes(:item).references(:item).group(:order_code, :receiver_name, :jan_code, :item_name, :remarks, :price).count
    csv = Utils::Csv::PickingListCsvBuilder::PickingListCsvOutput.new
    send_data(csv.output(picking_lists).encode(Encoding::SJIS), filename: 'picking_list.csv', disposition: 'attachment')
    logger.info('FINISH: export picking list')
    flash[:success] = 'ファイル変換が正常に行われました'
  rescue => e
    flash[:danger] = "ERROR: #{e.message}"
    redirect_to root_path
  end
end
