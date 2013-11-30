require 'open-uri'
require 'xmlsimple'
require 'pp'

  config = XmlSimple.xml_in(open("http://ep00.epimg.net/rss/elpais/portada.xml"))
  #if (//.match(config)
  File.open('yourfile', 'w') { |file| file.write(config) } 