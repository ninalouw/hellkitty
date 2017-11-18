module ApplicationHelper
    #helper to style flash messages
    def bootstrap_class_for(flash_type)
        case flash_type
            when "success"
                "alert-success"   # Green
            when "error"
                "alert-danger"    # Red
            when "alert"
                "alert-warning"   # Yellow
            when "notice"
                "alert-info"      # Blue
            else
                flash_type.to_s
            end
    end
    def parsed_tweet tweet
        _parsed_tweet = tweet.text.dup

        tweet.urls.each do |entity|
        html_link = link_to(entity.display_url.to_s, entity.expanded_url.to_s, target: '_blank')
        _parsed_tweet.sub!(entity.url.to_s, html_link)
        end
    
        tweet.media.each do |entity|
        html_link = link_to(entity.display_url.to_s, entity.expanded_url.to_s, target: '_blank')
        _parsed_tweet.sub!(entity.url.to_s, html_link)
        end
    
        _parsed_tweet.html_safe
    end
end
