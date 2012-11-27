if Rails.env == "production"
  ENV['WEBHOSTNAME'] = "http://lit-earth-7249.herokuapp.com"
else
  ENV['WEBHOSTNAME'] = "http://localhost:3000.com"
end
