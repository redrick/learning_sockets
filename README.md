## Learning Sockets in Ruby

Just a brief example what you can do with sockets in ruby

This is the simplest chat server you can possibly image, dumb enough that it bradcasts all comunication to all clients connected :)

### USAGE

To run the server just run:

```ruby run_server.rb```

it runs the server on port 2626


And then for client, run:

```sh run_client.sh 127.0.0.1```

where the IP address is the address of server (tryed it on LAN and works perfectly :))
if the IP address is not passed, it is substituted by "localhost" by default
