module HTMLEntityHelper
  def h(string)
    HTMLEntities.new.encode(string, :named)
  end
end
include HTMLEntityHelper
