class ApplicationMailer < ActionMailer::Base
  default from: "me@doctor.com"
  layout 'mailer'
end
