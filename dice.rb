require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end


get("/dice/2/6") do
  @first = rand(1..6)
  @second = rand(1..6)
  #total = first + second

  #@output = "You rolled a #{first} first and a #{second} second for a total of #{total}!"

  erb(:two_six)
end

get("/dice/2/10") do
  @first = rand(1..10)
  @second = rand(1..10)
  #total = first + second

  #@output = "You rolled a #{first} first and a #{second} second for a total of #{total}!"

  erb(:two_ten)
end

get("/dice/1/20") do
  @first = rand(1..20)

  @output = "You rolled a #{@first}!"

  erb(:one_twenty)
end

get("/dice/2/100") do
  @first = rand(1..100)
  @second = rand(1..100)
  #total = first + second

  #@output = "You rolled a #{first} frist and a #{second} second for a total of #{total}!"

  erb(:two_hundred)
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:hundred_six)
end
