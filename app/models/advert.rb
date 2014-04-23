
class Advert
  include Mongoid::Document
  include Mongoid::Sequence
  include Mongoid::Timestamps::Short
  extend Enumerize

  belongs_to :user
  has_many :images

  field :number, type: Integer
  sequence :number

  field :breed
  enumerize :breed, in: [:kind1, :kind2, :kind3]

  field :pvg
  enumerize :breed, in: [:kind1, :kind2, :kind3]

  field :count, type: Integer
  field :age, type: Integer
  field :stelnost, type: Integer
  field :udoi, type: Integer

  field :description, type: String
  field :price_by_deal, type: Boolean
  field :price, type: Integer  
  field :nds, type: Boolean
  field :with_delivery, type: Boolean

  field :adress_region, type: String
  field :adress_locale, type: String
  field :adress_city, type: String
  field :show_adress, type: Boolean, default: true

  field :email_user, type: String
  field :name_user, type: String
  field :phone_user, type: String
  field :show_user, type: Boolean, default: true

  field :deal_type
  enumerize :deal_type, in: [:sale, :buy]


  def check_my_time
    @count = Date.today.mjd - Date.parse(self.c_at.strftime("%Y-%m-%d")).mjd
    case @count
      when 30..90
        self.to_archive
      when 91
        self.to_trash
    end
  end

  state_machine initial: :draft do
    event :to_moderate do
      transition any => :moderate
    end

    event :to_publish do
      transition any => :published
    end

    event :to_archive do
      transition any => :archive
    end

    event :to_trash do
      transition any => :trash
    end

    event :to_draft do
      transition any => :draft
    end
  end

end
