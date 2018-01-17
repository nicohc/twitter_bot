require 'twitter'
require 'dotenv'
Dotenv.load


$client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["API_KEY"]
      config.consumer_secret     = ENV["API_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end


#Pour publier un tweet "Hello"
# $client.update('Hello')


clientstream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["API_KEY"]
  config.consumer_secret     = ENV["API_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

# streamer tous les tweets qui mentionnent tea, ou coffee. == Fonctionnel
=begin
topics = ["coffee", "tea"]
clientstream.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
=end


#Pour follow une liste de twittos  == Fonctionnel
=begin
def to_follow(*liste_personnes)
  liste_personnes.each{ |twittos| $client.follow(twittos) }
end
to_follow("Fabien_971","Mamarieponpont")
=end

#print $client.user("Mamarieponpont")







=begin CHANTIER
$client.update_with_media("Coding with #THP!", File.new(url="https://media.giphy.com/media/ULR7kNP2lhJXW/giphy.gif"))

#Envoyer un Direct Message ou message privé à un abonné




clientmess = Twitter::DirectMessage::Client.new do |config|
  config.consumer_key        = ENV["API_KEY"]
  config.consumer_secret     = ENV["API_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

clientmess(destinataire)
client.update('Hello')

=end
