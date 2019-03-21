require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.ftp_host = Sigdiv::Application.config.ftp.host
  config.ftp_port = Sigdiv::Application.config.ftp.port
  config.ftp_user = Sigdiv::Application.config.ftp.username
  config.ftp_passwd = Sigdiv::Application.config.ftp.password
  config.ftp_folder = Sigdiv::Application.config.ftp.folder
  config.ftp_url = Sigdiv::Application.config.ftp.url
  config.ftp_passive = true # false by default
  config.ftp_tls = false # false by default
  config.ftp_chmod = false
end