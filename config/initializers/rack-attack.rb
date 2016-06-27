class Rack::Attack
  Rack::Attack.blacklist('allow2ban login scrapers') do |req|
    Rack::Attack::Allow2Ban.filter(req.ip, :maxretry => 20, :findtime => 1.minute, :bantime => 24.hour) do
      req.path == '/login' and req.post?
    end
  end
  Rack::Attack.blacklisted_response = lambda do |env|
    [ 503, {}, ['Blocked']]
  end
end