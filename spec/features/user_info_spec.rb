require 'rails_helper'

describe 'when a user visits /users/new' do
  it 'should be able to create accounts' do
    name = "Mary"
    email = "mary@gmail.com"
    password = "mary1"

    visit new_user_path

    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password

    click_button "Create User"

    user = User.all.last

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content(user.name)
  end
end
