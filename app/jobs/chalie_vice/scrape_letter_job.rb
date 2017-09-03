# frozen_string_literal: true
module ChalieVice
  class ScrapeLetterJob < ChalieVice::ApplicationJob
    queue_as :default

    def perform(url)
      doc = open_nokogiri_document(url)

      title = xpath_text(doc, '/html/body/div[2]/section/div/div[1]/h1')
      logger.info("title: #{title}")
      description = doc.xpath('/html/body/div[2]/section/div/div[1]/*[2]')
                       .to_s.delete("\n").gsub(/^<p>/, '').gsub(%r{<\/p>}, '')
      category = xpath_text(doc, '/html/body/div[2]/ul/li[3]/a/span')
      logger.info("category: #{category}")
      thumb_image = doc.xpath('//div[2]/section/section/p/img').attr('src')
      logger.info("thumb_image: #{thumb_image}")
      letter = ChalieVice::Letter.where(url: url).first
      letter.remote_thumb_image_url = thumb_image
      letter.save
      doc.xpath('//div[2]/section/div/div[1]//p/img').map do |img|
        src = img.attr('src')
        logger.info("image_url: #{src}")
        # TODO: 写真を保存する処理
        description.gsub!(src, 'hogehoge')
      end
      logger.info("description: #{description}")
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
