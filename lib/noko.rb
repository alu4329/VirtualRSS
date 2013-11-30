require 'nokogiri'
require 'pp'
require 'open-uri'
require 'ruby-bitly'

  def truncate(text, length = 20, end_string = '…')
    words = text.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end

  @doc = Nokogiri::XML(open("http://rss.nytimes.com/services/xml/rss/nyt/InternationalHome.xml"))
  @doc2 = Nokogiri::XML(open("http://ep00.epimg.net/rss/elpais/portada.xml"))
      
  for i in 0..2
    @doc.search('title').children[i]
    if (@doc.search('description').children[i].text.length) > 27
      #@doc.search('description').children[i].text = 
      puts truncate(@doc.search('description').children[i].text)
    
    #puts Bitly.shorten(@doc.search('link').children[i], "o_1qfb1am5b6", "R_770c5cbd981cadac42359a65fed206df").url
    end
  end
  
