class TwitterApi
    def self.pia_public_tweets
        client.user_timeline("PiaGuerra", count: 18, exclude_replies: true, include_rts: false)
    end

    def self.ian_public_tweets
        client.user_timeline("IanBoothby", count: 18, exclude_replies: true, include_rts: false)
    end

    def self.client
        @client ||= Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV.fetch('TWITTER_CONSUMER_KEY')
            config.consumer_secret     = ENV.fetch('TWITTER_CONSUMER_SECRET')
        end
    end
end
