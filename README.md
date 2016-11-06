# ProjectEulerAPI
Lets you can programmatically check your solutions!

## Not complete!
This API does not use Project Euler's backend, so it needs solution contributions!

The currently known solutions are in ```data/solutions.txt```. If you have a solution to add,
please fork this repo, add it to the list, and make a pull request!

Here is a guide on how to fork and make a pull request: https://www.digitalocean.com/community/tutorials/how-to-create-a-pull-request-on-github

## How to use
This is a REST API, which basically means you send an HTTP request to check your solution.

### cURL
```bash
# To send the request to check if the solution for Problem 1 is 2.
curl -X GET 'https://projecteulerapi.herokuapp.com/api/problem/1/check/2'
# The response is in the JSON format
# {"status":200,"result":"incorrect","error":null}
```

### Ruby
using the ```HTTParty``` gem
```ruby
require 'HTTParty'
# need to run `gem install HTTParty` if you don't have it already

response = HTTParty.get 'https://projecteulerapi.herokuapp.com/api/problem/1/check/2'
puts response.parsed_response['result']
#=> incorrect
```

### Javascript (Node)
using the ```axios``` library
```javascript
const axios = require('axios')
// need to run `npm install --save axios` if not already in your project

axios.get('https://projecteulerapi.herokuapp.com/api/problem/1/check/2')
     .then((response) => {
       console.log(response.data.result)
     })
     .catch((error) => {
       console.log(error)
     })
//=> incorrect
```

### Elixir
using the ```HTTPotion``` and ```Poison``` Hex packages
```elixir
# requires HTTPotion and Poison to be dependencies in your mix.exs file

"https://projecteulerapi.herokuapp.com/api/problem/1/check/2"
|> HTTPotion.get
|> Map.get(:body)
|> Poison.decode!
|> Map.get("result")
|> IO.inspect

#=> incorrect
```
