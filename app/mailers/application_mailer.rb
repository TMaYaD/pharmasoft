# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
