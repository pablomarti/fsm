class DocumentType < ActiveRecord::Base

  has_many :human_documents

  attr_accessible :name
  validates :name,  :presence => true, :uniqueness => true
end
