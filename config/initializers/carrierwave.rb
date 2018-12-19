require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.ftp_host = 'xxx'
  config.ftp_port = 'xxx'
  config.ftp_user = 'xxx'
  config.ftp_passwd = 'xxx'
  config.ftp_folder = 'xxx'
  config.ftp_url = 'xxx'
  config.ftp_passive = true # false by default
  config.ftp_tls = false # false by default
  config.ftp_chmod = false
end