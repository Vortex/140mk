module WelcomeHelper
  def translate_list_name(name)
    case I18n.locale
    when :mk
      name.capitalize.to_cyr
    else
      name
    end
  end
end
