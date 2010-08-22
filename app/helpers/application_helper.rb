# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  include WillPaginate::ViewHelpers 

  def will_paginate_with_i18n(collection, options = {}) 
    will_paginate_without_i18n(collection, options.merge(:previous_label => I18n.t('pagination.previous'), :next_label => I18n.t('pagination.next'))) 
  end
  alias_method_chain :will_paginate, :i18n

  def twitter_path screen_name
    "http://twitter.com/#{screen_name}"
  end

  def tweet_url(tweet)
    "http://twitter.com/#{tweet.user.screen_name}/status/#{tweet.original_tweet_id}"
  end

  # Turns all hashtags into clickable links.  If a block is given, each url
  # is yielded and the result is used as the link text.
  def auto_link_hashtags(text)
    return '' if text.blank?

    result = text
    tags = text.gsub(/ ?#(\w+)/)
    tags.each do |entry|
      stripped_entry = entry.strip.gsub(/#|@/, "")
      tag = Tag.find_by_name(stripped_entry)

      unless tag.nil?
        link = link_to '#' + tag.name, tag
        result = result.gsub(entry.strip, link)
      end
    end

    return result
  end

#  def auto_link_urls(text, html_options = {})
#    link_attributes = html_options.stringify_keys
#    text.gsub(AUTO_LINK_RE) do
#      href = $&
#      punctuation = ''
#      left, right = $`, $'
#      # detect already linked URLs and URLs in the middle of a tag
#      if left =~ /<[^>]+$/ && right =~ /^[^>]*>/
#        # do not change string; URL is already linked
#        href
#      else
#        # don't include trailing punctuation character as part of the URL
#        if href.sub!(/[^\w\/-]$/, '') and punctuation = $& and opening = BRACKETS[punctuation]
#          if href.scan(opening).size > href.scan(punctuation).size
#            href << punctuation
#            punctuation = ''
#          end
#        end
#
#        link_text = block_given?? yield(href) : href
#        href = 'http://' + href unless href =~ %r{^[a-z]+://}i
#
#        content_tag(:a, h(link_text), link_attributes.merge('href' => href)) + punctuation
#      end
#    end
#  end


end
