describe 'when a user visits /login' do
  it 'should be able to login' do
    user = User.create(name: "Mary", email: "mary@gmail.com", password: "mary1")

    visit login_path

    fill_in :email, with: "#{user.email}"
    fill_in :password, with: "#{user.password}"

    click_button "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content(user.name)
  end
end
