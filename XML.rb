require 'xmlsimple'


  config = XmlSimple.xml_in('something.xml')
  puts config['Address']#['type'][1]
  File.open('text.txt', 'w') do |fichero|
    fichero.puts config.find_all { |key, value| key.start_with? '' }
  end