module Features
  def sign_in_as(user)
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "password"
    click_button("commit")
  end

  def sign_up_as(user)
    fill_in "Username", with: "#{user.username}"
    fill_in "Email", with: "#{user.email}"
    fill_in "user[password]", with: "#{user.password}"
    fill_in "user[password_confirmation]", with: "#{user.password}"
    click_button("commit")
  end
end
