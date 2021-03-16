class Rack::Attack
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip
  end

  throttle('stop bruteforce', limit: 5, period: 3.minutes) do |req|
    if req.path == '/logar' && req.post?
      req.ip
    end
  end

  throttle('logins/email', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      req.params['login'].presence
    end
  end
end