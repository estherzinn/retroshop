class Game < ActiveRecord::Base
      extend FriendlyId
      friendly_id :name, use: :slugged
      has_many :sales
      belongs_to :user
      
      has_attached_file :image
      validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
      has_attached_file :resource

      validates_attachment_content_type :image, 
      content_type:  /^image\/(png|gif|jpeg)/,
      message: "Only images allowed"

      validates_attachment_content_type :resource,
      content_type: ['application/pdf'],
      message: "Only pdfs allowed"

      validates :image, attachment_presence: true
      validates :resource, attachment_presence: true

end
