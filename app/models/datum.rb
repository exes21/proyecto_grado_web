class Datum < ApplicationRecord
  belongs_to :mobile
  belongs_to :access_point
end

class Ping < Datum ; end
class Latency < Datum ; end
class Jitter < Datum ; end
class LinkSpeed < Datum ; end
class SignLevel < Datum ; end