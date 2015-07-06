class Holder < ActiveRecord::Base
  validates :name, :country, :status, presence: true

  before_save :format_name, :format_city, :format_date

  scope :lastname_starts_with, ->(letters) { where('name like ?', "% #{letters}%") }

  def self.refresh_info_for(letters)
    lastname_starts_with(letters).delete_all
    Holder.create(PMI::Scraper.new.get_info_for(letters))
  end

  private

  def format_name
    current_name_value = name
    name_details = current_name_value.split(/\W+/).map { |w| w.strip.capitalize }

    return self.name = name_details.first if name_details.size == 1

    formatted_name = [name_details.first, name_details.last].join(' ')
    self.name = formatted_name
  end

  def format_city
    self.city = city.split.map(&:capitalize).join(' ')
  end

  def format_date
    return true if date_of_certification.is_a? Date

    self.date_of_certification = Date.parse(date_of_certification)
  end
end
