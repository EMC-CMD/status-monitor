class WelcomeController < ApplicationController
  def index
    $redis.set('Type', 'Movie')
    @type = $redis.get('Type')
    @movies = Movie.all
    $bunny.start
    channel = $bunny.create_channel
    q = channel.queue('queue1')
    q.publish("i am a message!")
    # _, _, payload = q.pop
    # @rabbit_message = payload

    bunny2 = Bunny.new
    bunny2.start
    channel2 = bunny2.create_channel
    q2 = channel2.queue('queue1')
    _, _, payload = q2.pop
    @rabbit_message = payload
  end
end
