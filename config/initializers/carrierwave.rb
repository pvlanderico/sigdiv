require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.ftp_host = nil#Sigdiv::Application.config.ftp.host
  config.ftp_port = nil#Sigdiv::Application.config.ftp.port
  config.ftp_user = nil#Sigdiv::Application.config.ftp.username
  config.ftp_passwd = nil#Sigdiv::Application.config.ftp.password
  config.ftp_folder = nil#Sigdiv::Application.config.ftp.folder
  config.ftp_url = nil#Sigdiv::Application.config.ftp.url
  config.ftp_passive = true # false by default
  config.ftp_tls = false # false by default
  config.ftp_chmod = false
end