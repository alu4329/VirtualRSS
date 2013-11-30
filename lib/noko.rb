require 'nokogiri'
require 'pp'
require 'open-uri'
require 'ruby-bitly'

  @doc = Nokogiri::XML(open("http://rss.nytimes.com/services/xml/rss/nyt/InternationalHome.xml"))
  @doc2 = Nokogiri::XML(open("http://ep00.epimg.net/rss/elpais/portada.xml"))
      
  for i in 0..@doc.search('title').length - 10
    puts @doc.search('title').children[i]
    puts Bitly.shorten(@doc.search('link').children[i], "o_1qfb1am5b6", "R_770c5cbd981cadac42359a65fed206df").url
  end