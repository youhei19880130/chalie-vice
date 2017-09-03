# frozen_string_literal: true
module ChalieVice
  class ScrapeItemJob < ChalieVice::ApplicationJob
    queue_as :default

    def perform(url)
      doc = open_nokogiri_document(url)
      return if doc.blank?

      title = xpath_text(doc, '/html/body/div[2]/section/section/div/div[2]/div/h1')
      logger.info("title: #{title}")
      variation = xpath_text(doc, '//*[@id="variations"]')
      logger.info("variations: #{variation}")
      body = xpath_html(doc, '/html/body/div[2]/section/section/div/div[2]/div/p/section[1]', true)
      description = body.split('【購入時の注意事項について】')[0]&.gsub('<p>','')
      detail = body.split('【購入時の注意事項について】')[1]&.gsub('</p>','')
      logger.info("description: #{description}")
      logger.info("detail: #{description}")
      #detail = doc.xpath('/html/body/div[2]/section/section/div/div[2]/div/p/section[2]/div')
      #            .to_s.gsub('<div style="font-size:12px">', '').gsub('</div>', '')
      #logger.info("detail: #{detail}")
      price = xpath_text(doc, '/html/body/div[2]/section/section/div/div[2]/div/p[1]/span').delete('￥').delete(',')
      logger.info("price: #{price}")
      category = xpath_text(doc, '/html/body/div[2]/ul/li[3]/a/span')
      logger.info("category: #{category}")
      ChalieVice::Item.create(name: title, price: price, category_name: category, description: description, detail: detail, url: url)
      item_id = ChalieVice::Item.last.id
      doc.xpath('/html/body/div[2]/section/section/div/div[1]/ul/li/a/img').map do |img|
        src = img.attr('src').gsub('SQ_S', 'LL')
        logger.info("image_url: #{src}")
        image = ChalieVice::ItemImage.new(item_id: item_id)
        image.remote_image_url = src
        image.save
      end
    end

    private

    def open_nokogiri_document(url, limit = 5)
      file = Utils::FileUtil.url_file_handler(url, limit)
      return nil if file.nil?
      Nokogiri::HTML.parse(file.read, nil, file.charset)
    rescue
      nil
    end

    def xpath_text(doc, query, delete_space = false)
      text = doc.xpath(query).text.strip
      if delete_space
        text.delete("\n").delete("\r").delete(' ')
      else
        text.delete("\n").delete("\r")
      end
    end

    def xpath_html(doc, query, delete_space = false)
      text = doc.xpath(query).inner_html.strip
      if delete_space
        text.delete("\n").delete("\r").delete(' ')
      else
        text.delete("\n").delete("\r")
      end
    end
  end
end
