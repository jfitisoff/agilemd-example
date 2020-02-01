# https://github.com/jfitisoff/insite/wiki/Defining-Page-Objects
class SignInPage < AgileMDSite::Page
  set_url "/signin{?query*}"

  text_field :email_address, placeholder: 'Email address'
  text_field :password, placeholder: 'Password'
  a :get_a_new_password, text: 'Get a new password'
  button :sign_in_button, text: 'Sign in'

  def sign_in(**kwargs)
    update_page(**kwargs)
    sign_in_button.click
    sleep 0.2
  end
end
