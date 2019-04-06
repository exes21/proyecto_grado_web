class IssuesReport < ApplicationRecord
  belongs_to :issue
  belongs_to :data
end
