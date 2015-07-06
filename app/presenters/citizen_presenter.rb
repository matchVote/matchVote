class CitizenPresenter < SimpleDelegator
  def initialize(user)
    super(CitizenDecorator.new(user))
  end

  def citizen
    @citizen ||= __getobj__
  end

  def contact
    @contact ||= ContactPresenter.new(__getobj__.contact || Contact.new)
  end

  def subtitle
    return "" unless address.state.present?
    "Voter from #{address.state}".tap do |s| 
      s.prepend("#{party_formatted} ") if party_formatted.present?
    end
  end

  def display_all_stances?
    settings(:privacy).display_all_stances == "true"
  end

  # Personal Info

  def name
    full_name.blank? ? username : full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def party_formatted
    (citizen.party || "").titleize
  end

  # Contact Info

  def address
    contact.postal_addresses.first || NullObject.new
  end

  def phone_number
    contact.phone_number
  end

  def twitter_username
    contact.twitter_username
  end

  # Forms

  def personal_info_form
    @personal_info_form ||= PersonalInfoForm.new
  end
end
