class Datum < ApplicationRecord
  belongs_to :mobile
end

class Ping < Datum ; end
class Latency < Datum ; end
class Jitter < Datum ; end
class LinkSpeed < Datum ; end
class SignLevel < Datum ; end