require 'xmlsimple'


  config = XmlSimple.xml_in('something.xml')
  
  puts config['Address'][1]['title']
  #config['Address'].select{ |k,v| k.start_with? ''}
  #puts config.find_all { |key, value| key.start_with? ''}
  
  
  
  
=begin
  INTRODUCIMOS LOS DATOS EN EL FICHERO text.txt
  
  File.open('text.txt', 'w') do |fichero|
    fichero.puts config.find_all { |key, value| key.start_with? '' }
  end
=end
