# Descarga la imagen y luego adjúntala al usuario
admin_user = User.create(
  name: 'Admin User',
  email: 'admin@mail.com',
  password: '123456',
  role: 'admin'
)

# Descarga la imagen y adjúntala al usuario
admin_user.profile_picture.attach(
  io: URI.open('https://dummyimage.com/300/000/fff'),
  filename: 'profile_picture.png'
)
