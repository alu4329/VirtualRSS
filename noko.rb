require './words.rb'

def show_rss (doc, numero)
  doc = "http://" << doc
  @doc = Nokogiri::XML(open(doc))
  @resultado = {:title =>[], :link =>[]}
  for i in 2..(numero+1)
    if (@doc.search('description').children[i].class != NilClass)
      @doc.search('title').children[i]
      if (@doc.search('description').children[i].text.length) > 10
        @resultado[:title].push(truncate(@doc.search('description').children[i].text))
        @resultado[:link].push(@doc.search('link').children[i].text)
      end
    end
  end
  @resultado
end