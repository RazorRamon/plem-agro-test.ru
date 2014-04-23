class User
  include Mongoid::Document
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  ## custom fields
  field :user_type
  enumerize :user_type, in: [:law, :private]

  field :name_org, type: String
  field :plem_status
  enumerize :plem_status, in: [:factory, :reprod, :no], multiple: true

  field :fio, type: String
  field :phone, type: String
  field :phone_work, type: String
  field :phone_fax, type: String
  field :site_url, type: String

  field :adress_region, type: String
  field :adress_locale, type: String
  field :adress_city, type: String
  field :adress_postnum, type: String

  field :not_receive_questions, type: Mongoid::Boolean
  field :about, type: String

end
