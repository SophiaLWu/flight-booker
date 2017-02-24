class ApplicationMailer < ActionMailer::Base
  default from: 'flights@flightbooker.com'
  layout 'mailer'
end
