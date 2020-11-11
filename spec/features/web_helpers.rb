def sign_up(username, password)
    visit '/'
    fill_in 'new_username', with: username
    fill_in 'new_password', with: password
    click_button 'Sign Up'
end

def log_in(username, password)
    visit '/'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Log in'
end