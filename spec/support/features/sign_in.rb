module Features
  def sign_in_as(user)
    visit root_path
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "password"
    click_button("commit")
  end
end
