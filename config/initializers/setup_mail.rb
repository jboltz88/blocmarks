ActionMailer::Base.smtp_settings = {
  address:        'smtp.mailgun.org',
  port:           '587',
  authentication: :plain,
  user_name:      ENV['MAILGUN_SMTP_LOGIN'],
  password:       ENV['MAILGUN_SMTP_PASSWORD'],
  domain:         'app33fc0539b18440a89dd5663180c71b18.mailgun.org',
  content_type:   'text/html'
}

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.raise_delivery_errors = true

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  'boltz.justin@gmail.com'
    message.cc = nil
    message.bcc = nil
  end
end

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
