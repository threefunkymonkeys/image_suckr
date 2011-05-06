class String
  def to_query(key)
    require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
    "#{CGI.escape(key.to_s).gsub(/%(5B|5D)/n) { [$1].pack('H*') }}=#{CGI.escape(to_s)}"
  end
end

class Hash
  def to_query(namespace = nil)
    collect do |key, value|
      value.to_query(namespace ? "#{namespace}[#{key}]" : key)
    end.sort * '&'
  end
end
