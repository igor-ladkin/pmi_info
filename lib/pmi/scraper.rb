require 'capybara'
require 'capybara/poltergeist'

module PMI
  Capybara.current_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
  Capybara.run_server = false

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, {js_errors: false})
  end

  RESULTS_URL = 'https://certification.pmi.org/registry.aspx'

  class Scraper
    attr_accessor :session

    def initialize
      @session = Capybara::Session.new(:poltergeist)
    end

    def get_info_for(param)
      session.visit RESULTS_URL

      session.fill_in 'dph_RegistryContent$tbSearch', with: param
      session.select 'Russian Federation', from: 'dph_RegistryContent$wcountry'
      session.click_on 'Search'

      records = []
      session.all('tr').each do |row|
        values = row.all('td')
        next if values.size == 0

        record = {}
        [:name, :city, :country, :credential, :date_of_certification, :status].each_with_index do |key, index|
          record[key] = values[index].text.empty? ? records.last[key] : values[index].text
        end

        records << record
      end

      session.driver.quit
      records
    end
  end
end
