require 'twitter'
require 'dotenv'
Dotenv.load


$client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["API_KEY"]
      config.consumer_secret     = ENV["API_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

$clientstream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["API_KEY"]
  config.consumer_secret     = ENV["API_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

#Pour publier un tweet "Hello"
def message(texte)
  $client.update(texte)
end
#message("Hello!")


#Pour envoyer un message à plusieurs personnes avec personnalisation
def message_commun(people)
  people.each do |user|
    message = 'Hello ! ' + user
    $client.update(message)
    end
end
# message_commun(["@ThpTest","@Fabien_971"])



# streamer tous les tweets qui mentionnent tea, ou coffee.
def topic_stream(*topics)
  $client.filter(track: topics.join(",")) { |object|
    puts object.text if object.is_a?(Twitter::Tweet)  #On filtre tous les éléments trouvés de type tweet
  }
end
#topic_stream(["coffee","tea"])


#Pour follow une liste de twittos
def to_follow(*liste_personnes)
  liste_personnes.each{ |twittos|
    $client.follow(twittos)
    print "Follow #{twittos} : C'est fait !"
  }
end
to_follow("Fabien_971","Mamarieponpont")
