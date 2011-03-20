module ApplicationHelper

  def twitter_path screen_name
    "http://twitter.com/#{screen_name}"
  end 

  def is_trending_filter_selected(days_count)
    saved_count = session[:trending_from]
    if saved_count == days_count
      return "selected"
    else
      return ""
    end
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

  def auto_link_screen_names(text)
    return '' if text.blank?

    result = text
    screen_names = text.gsub(/ ?@(\w+)/)
    screen_names.each do |entry|
      stripped_entry = entry.strip.gsub(/#|@/, "")

      unless entry.nil?
        link = link_to '@' + stripped_entry, "http://twitter.com/#{stripped_entry}", :target => '_blank'
        result = result.gsub(entry.strip, link)
      end
    end

    return result
  end 

  def auto_link_resources(text)
    auto_link_screen_names(auto_link_hashtags(text))
  end

end
