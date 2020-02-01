# https://github.com/jfitisoff/insite/wiki/Defining-Components
class ErrorBanner < AgileMDSite::Component
  select_by tag_name: 'div', class: 'error-banner'

  def close
    button.click
  end
end
