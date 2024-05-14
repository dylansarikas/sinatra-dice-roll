require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "
  <h1>Dice Roll!</h1>
  <ul>
    <li><a href=\"/dice/2/6\">Roll 2 d6 die</a></li>
    <li><a href=\"/dice/2/10\">Roll 2 d10 die</a></li>
    <li><a href=\"/dice/1/20\">Roll 1 d20 dice</a></li>
    <li><a href=\"/dice/2/100\">Roll 2 d100 die</a></li>
  </ul>
  "
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end


get("/dice/2/6") do
  first = rand(1..6)
  second = rand(1..6)
  total = first + second

  output = "You rolled a #{first} first and a #{second} second for a total of #{total}!"

  "<h1>2d6</h1>
   <p>#{output}</p>"
end

get("/dice/2/10") do
  first = rand(1..10)
  second = rand(1..10)
  total = first + second

  output = "You rolled a #{first} first and a #{second} second for a total of #{total}!"

  "<h1>2d10</h1>
   <p>#{output}</p>"
end

get("/dice/1/20") do
  first = rand(1..20)

  output = "You rolled a #{first}!"

  "<h1>1d20</h1>
   <p>#{output}</p>"
end

get("/dice/2/100") do
  first = rand(1..100)
  second = rand(1..100)
  total = first + second

  output = "You rolled a #{first} frist and a #{second} second for a total of #{total}!"

  "<h1>2d100</h1>
   <p>#{output}</p>"
end
