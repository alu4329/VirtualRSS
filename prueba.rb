require 'open-uri'
require 'nokogiri'
require 'pp'
require 'ruby-bitly'

@doc = Nokogiri::XML(open("http://rss.nytimes.com/services/xml/rss/nyt/InternationalHome.xml"))

a = Bitly.shorten(" http://rss.nytimes.com/services/xml/rss/nyt/InternationalHome.xml", "o_1qfb1am5b6", "R_770c5cbd981cadac42359a65fed206df").url

p a