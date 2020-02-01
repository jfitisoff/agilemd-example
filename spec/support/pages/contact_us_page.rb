# https://github.com/jfitisoff/insite/wiki/Defining-Page-Objects
class ContactUsPage < AgileMDSite::Page
  set_url "/contact-us"

  text_field :your_name, id: 'Your-name'
  text_field :email_address, id: 'Email-address'
  text_field :phone_number, id: 'Phone-number'
  radio_widget :email, index: 0
  radio_widget :phone, index: 1
  text_field :your_title_or_role, id: 'Your-title-or-role'
  text_field :organization, id: 'Organization'
  checkbox_widget :clinical_deterioration_and_sepsis_management, index: 0
  checkbox_widget :pama_and_imaging_appropriateness, index: 1
  checkbox_widget :ehr_integrated_clinical_pathways, index: 2
  checkbox_widget :other, index: 3
  textarea :any_additional_questions_or_comments, index: 0
  input :submit_button, xpath: "//form/input[@type='submit']"

  def submit(**kwargs)
    update_page(**kwargs)
    submit_button.click
  end
end
