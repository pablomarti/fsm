class Aggression < ActiveRecord::Base
  belongs_to :aggression_kind
  belongs_to :system_case
  # attr_accessible :title, :body
end
