Iconsole.configure do |config|
  config.username     = 'admin-iconsole'
  config.md5_password = Digest::MD5.hexdigest('iconsole')
end
