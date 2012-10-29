
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
  u = User.find_or_create_by(name: name)
  if auth_options.empty?
    u.authentications.create
  else
    u.authentications.create( auth_options, auth_class)
  end
  if name == 'root'
    u.is_admin = true
    u.save!
  end
  u
end
