class Incident < ActiveRecord::Base
  belongs_to :incident_kind
  belongs_to :system_case
  # attr_accessible :title, :body
end
