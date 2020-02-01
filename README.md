# agilemd-example
Some contrived rspec tests for AgileMD's corporate site. I only wrote support for the pages I needed.

## Setup
- The project's currently configured to use Ruby 2.6.5. If you have a different Ruby version you'll need to change the version in .ruby-version.rb at the root of the repo.
- Download the [chromedriver](http://chromedriver.chromium.org/downloads) binary that's compatible with your chrome version and put it somewhere on your path.
- `bundle install`

## Usage

Note: If you see the following warning:

`WARN Selenium [DEPRECATION] Selenium::WebDriver::Error::ElementNotVisibleError is deprecated.`

It's harmless (There are some upcoming changes in Selenium 4 and this is just an early alert that those are coming.)

See [this link](https://stackoverflow.com/questions/56445641/ruby-watir-selenium-webdriver-depricated-warning/) for more details.

### Running Tests
From the repo root:

`bundle exec rspec spec/agile_md_spec.rb`

## Using the Console
Run `console.rb` at the repo root to get a REPL. The script loads all of the site files and then invokes pry. Example commands ('s' is a site instance that you can use to navigate the site):

Note: Navigation is handled automatically.

`s.reset_password_page.email_address.present?`

`s.home_page`

To get a list of pages that have been defined for the site.
`s.pages`
