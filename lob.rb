require 'csv'
require 'lob'

@lob = Lob(api_key: ENV['LOB_API_KEY'])

CSV.foreach('addresses.csv', headers: true, header_converters: :symbol) do |row|

  @lob.postcards.create(
    "Postcard for #{row[:name]}",
    {name: row[:name], address_line1: row[:address_line1],
     city: row[:city], state: row[:state],
     country: row[:country], zip: row[:zip]},
    from: 'adr_858931f44e17fba9',
    front: 'https://www.lob.com/postcardfront.pdf',
    message: 'Howdy! Greetings from San Francisco.'
  )

end
