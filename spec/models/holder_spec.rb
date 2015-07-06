require 'rails_helper'

RSpec.describe Holder, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :country }
  it { is_expected.to validate_presence_of :status }
end
