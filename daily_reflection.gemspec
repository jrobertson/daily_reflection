Gem::Specification.new do |s|
  s.name = 'daily_reflection'
  s.version = '0.1.0'
  s.summary = 'Used to keep a personal journal of things worth reflecting ' + 
      'upon on a daily basis. Entries are retrieved and stored in a ' + 
      'markdown file with date headings created in reverse chronological ' +
      'order.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/daily_reflection.rb']
  s.add_runtime_dependency('wiki_md', '~> 0.6', '>=0.6.0')
  s.signing_key = '../privatekeys/daily_reflection.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/daily_reflection'
end
