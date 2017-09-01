CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJCY7UJDCWEQPRQAQ',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'chalie-vice-images-dev'
  config.cache_dir = :fog
end
