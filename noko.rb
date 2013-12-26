require './words.rb'


  #@doc = Nokogiri::XML(open("http://rss.nytimes.com/services/xml/rss/nyt/InternationalHome.xml"))
  #@doc2 = Nokogiri::XML(open("http://ep00.epimg.net/rss/elpais/portada.xml"))

def show_rss (doc, numero)
  @doc = Nokogiri::XML(open(doc))
  @resultado = {:title =>[], :link =>[]}
  for i in 2..(numero+1)
    if (@doc.search('description').children[i].class != NilClass)
      puts @doc.search('description').children[i].class
      @doc.search('title').children[i]
      if (@doc.search('description').children[i].text.length) > 10
        @resultado[:title].push(truncate(@doc.search('description').children[i].text))
        @resultado[:link].push(@doc.search('link').children[i].text)
      end
    end
  end
  @resultado
end