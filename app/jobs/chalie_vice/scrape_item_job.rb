# frozen_string_literal: true
module ChalieVice
  class ScrapeItemJob < ChalieVice::ApplicationJob
    queue_as :default

    def perform(url)
      doc = open_nokogiri_document(url)

      title = xpath_text(doc, '/html/body/div[2]/section/section/div/div[2]/div/h1')
      logger.info("title: #{title}")
      variation = xpath_text(doc, '//*[@id="variations"]')
      logger.info("variations: #{variation}")
      description = xpath_text(doc, '/html/body/div[2]/section/section/div/div[2]/div/p/section[1]')
      logger.info("description: #{description}")
      detail = doc.xpath('/html/body/div[2]/section/section/div/div[2]/div/p/section[2]/div')
                  .to_s.gsub('<div style="font-size:12px">', '').gsub('</div>', '')
      logger.info("detail: #{detail}")
      category = xpath_text(doc, '/html/body/div[2]/ul/li[3]/a/span')
      logger.info("category: #{category}")
      doc.xpath('/html/body/div[2]/section/section/div/div[1]/ul/li/a/img').map do |img|
        src = img.attr('src').gsub('SQ_S', 'LL')
        logger.info("image_url: #{src}")
        # TODO: 写真を保存する処理
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
  end
end
