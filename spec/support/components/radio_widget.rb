# https://github.com/jfitisoff/insite/wiki/Defining-Components
class RadioWidget < AgileMDSite::Component
  select_by tag_name: 'input', type: 'radio'

  def clear
    if set?
      hover
      sleep 0.03
      focus
      sleep 0.1
      @browser.send_keys(:space)
    end
  end

  def set
    if !set?
      hover
      sleep 0.03
      focus
      sleep 0.1
      @browser.send_keys(:space)
    end
  end

  def update(value)
    case value.to_s
    when 'true'
      set
    when 'set'
      set
    when 'false'
      set
    else
      update_object(value)
    end
  end
end
