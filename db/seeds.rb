require 'aws-sdk-s3'

Aws.config.update(
  region: ENV['aws_bucket_region'],
  credentials: Aws::Credentials.new(
    ENV['aws_access_key_id'],
    ENV['aws_secret_access_key']
  )
)

admin_user = User.create(
  name: 'Admin User',
  email: 'admin@mail.com',
  password: '123456',
  role: 'admin'
)
admin_user.profile_picture.attach(
  io: URI.open('https://rails-luis-bucket.s3.us-east-2.amazonaws.com/mlz596kreencfhad2aw31jvd2jva'),
  filename: 'profile_picture.jpg'
)
