require 'rspec'
require_relative 'spec_helper'

describe "agilemd corporate site" do
  before(:all) { @s = AgileMDSite.new.open }
  let(:site) { @s }

  context 'contact us page' do
    it "populates the form without submitting" do
      site.contact_us_page.update_page(
        your_name: 'Ada',
        email_address: 'bad',
        phone_number: '555-1212',
        email: :set,
        your_title_or_role: 'supercargo',
        organization: 'org name',
        other: :set,
        any_additional_questions_or_comments: 'No'
      )

      expect(site.your_name.value).to eq 'Ada'
      expect(site.email_address.value).to eq 'bad'
      expect(site.phone_number.value).to eq '555-1212'
      expect(site.email.set?).to eq true
      expect(site.your_title_or_role.value).to eq 'supercargo'
      expect(site.organization.value).to eq 'org name'
      expect(site.other.set?).to eq true
      expect(site.any_additional_questions_or_comments.value).to eq 'No'
    end
  end

  context 'password reset page' do
    it "displays an error banner when bad email address is used for reset attempt" do
      site.password_reset_page
      expect(site.error_banner.present?).to eq false
      site.send_link(email_address: 'bad@example.com')
      expect(site.error_banner.present?).to eq true
    end
  end

  context 'sign in page' do
    it "displays an error banner when sign in attempt fails" do
      site.sign_in_page
      site.sign_in(email_address: 'bad@example.com', password: 'bogus')
      expect(site.error_banner.present?).to eq true
      expect(site.error_banner.text).to eq "Incorrect email/password combination"
    end

    it "closes error banner after failed sign in attempt" do
      site.sign_in_page.visit
      site.sign_in(email_address: 'bad@example.com', password: 'bogus')
      expect(site.error_banner.present?).to eq true
      site.error_banner.close
      expect(site.error_banner.present?).to eq false
    end
  end

  context 'home page' do
    it "displays hamburger button when browser width is reduced" do
      expect(site.home_page.navbar.hamburger.present?).to eq false
      site.browser.window.resize_to(750, 600)
      expect(site.home_page.navbar.hamburger.present?).to eq true
    end
  end
end
