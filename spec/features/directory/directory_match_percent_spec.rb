require "rails_helper"
require "support/helpers/stance_helper"
require "support/page_objects/directory_page"

feature "Directory match percentage" do
  given(:user) { create(:user) }
  given(:rep) { create(:representative) }
  given(:directory) { DirectoryPage.new }
  given(:helper) { StanceHelper.new }

  background do
    values = {
      one: [ {agreeance_value:  1, importance_value: 3},
             {agreeance_value: -1, importance_value: 0},
             {agreeance_value: -2, importance_value: 2} ],
      two: [ {agreeance_value:  1, importance_value: 1},
             {agreeance_value: -1, importance_value: 4},
             {agreeance_value:  3, importance_value: 4} ]
    }
    helper.create_stances_for(user, rep, values)
    directory.visit
  end

  scenario "shows match percent per rep" do
    expect(directory).to have_content "75%" 
  end
end

