begin
  MAILBOXLAYER = YAML.load_file(::Rails.root.join('config', 'mailboxlayer.yml')).with_indifferent_access
rescue Errno::ENOENT
  raise 'config/mailboxlayer.yml was not found'
end
