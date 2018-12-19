require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.ftp_host = Sadp::Application.config.ftp.host
  config.ftp_port = Sadp::Application.config.ftp.port
  config.ftp_user = Sadp::Application.config.ftp.username
  config.ftp_passwd = Sadp::Application.config.ftp.password
  config.ftp_folder = Sadp::Application.config.ftp.folder
  config.ftp_url = Sadp::Application.config.ftp.url
  config.ftp_passive = true # false by default
  config.ftp_tls = false # false by default
  config.ftp_chmod = false
end