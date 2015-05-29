require "support/page_objects/page"

class SignUpPage < Page
  def visit
    page.visit root_path
    click_link "Create Account"
  end

  def use_default_account_info
    fill_in "Username", with: "leroy_jenkins"
    fill_in "Email", with: "leroy@jenkins.com"
    fill_in "Password", with: "!123abcd"
    fill_in "Confirm Password", with: "!123abcd"
  end

  def fill_in_contact_info
    fill_in "Phone", with: "1234567890"
  end

  def create_account
    click_button "Create Account"
  end

  def create_account_with(options)
    confirm = options[:confirm] ? options[:confirm] : options[:password]
    fill_in "Username", with: options[:username]
    fill_in "Email", with: options[:email]
    fill_in "Password", with: options[:password]
    fill_in "Confirm Password", with: confirm
    create_account
  end
end

