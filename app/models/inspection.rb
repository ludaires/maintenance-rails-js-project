class Inspection < ApplicationRecord
  belongs_to :maintenance
  belongs_to :part
  belongs_to :issue
  belongs_to :cause
  belongs_to :action

end
