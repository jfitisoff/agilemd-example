# https://github.com/jfitisoff/insite/wiki/Defining-Page-Objects
class PasswordResetPage < AgileMDSite::Page
  set_url "/password/reset"

  text_field :email_address, placeholder: 'Email address'
  button :send_link_button, text: 'Send link'

  def send_link(**kwargs)
    update_page(**kwargs)
    send_link_button.click
    sleep 0.2
  end
end
