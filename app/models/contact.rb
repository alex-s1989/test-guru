class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true
  
  def headers
    {
      :subject => "Contact Form",
      :to => "shu5388369@gmail.com",
      # :to => "#{ Admin.pluck(:email) }",
      :from => %("#{name}" <#{email}>)
    }
  end
end
