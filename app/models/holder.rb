class Holder < ActiveRecord::Base
  validates :name, :country, :status, presence: true

  before_save :format_name, :format_city, :format_date

  private

  def format_name
    current_name_value = name
    name_details = current_name_value.split(/\s+/).map(:strip)

    return self.name = name_details.first.capitalize if name_details.size == 1

    formatted_name = [name_details.first, name_details.last].join(' ').capitalize
    self.name = formatted_name
  end

  def format_city
    self.city = city.capitalize
  end

  def format_date
    return true if date_of_certification.is_a? Date

    self.date_of_certification = Date.parse(date_of_certification)
  end
end
