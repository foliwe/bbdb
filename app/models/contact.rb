class Contact < MailForm::Base
    attribute :name, :validate => true
    attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :subject,   :validate => true
    attribute :message 
  
    def headers
      {
        :subject => "Contact Form",
        :to => "youremail@foo.com",
        :from => %("#{name}" <#{email}>)
      }
    end
  end