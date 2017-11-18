class TwitterApi
    def self.pia_public_tweets
        client.user_timeline("PiaGuerra", count: 20, exclude_replies: true, include_rts: false)
    end

    def self.ian_public_tweets
        client.user_timeline("IanBoothby", count: 20, exclude_replies: true, include_rts: false)
    end

    def self.client
        @client ||= Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
            config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        end
    end
end
