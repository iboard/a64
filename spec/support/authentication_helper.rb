
def sign_in_as_admin
  delete sign_out_path
  begin
    root = User.find('root')
  rescue
    root = User.create(name: 'root')
    root.authentications.create({password: 'secret', password_confirmation: 'secret'}, PasswordAuthentication)
  end
  root.is_admin=true
  root.save!
  visit new_session_path
  fill_in "Username", with: "root"
  fill_in "Password", with: "secret"
  click_button "Log in"
end

def create_authenticated_user(name, auth_options={}, auth_class=PasswordAuthentication)
  u = User.create(name: name, is_admin: name == 'root')
  if auth_options == {}
    u.authentications.create
  else
    u.authentications.create( auth_options, auth_class)
  end
  u
end
