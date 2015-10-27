# Rails Session Decoder

A command line tool that decrypts an encrypted rails 4 session. In order to decrypt the session cookie, the user must know the value of the cookie and the value of the secret key.  The secret key can be found in `config/secrets.yml`.

__Setup__

```
bundle install
bundle exec ruby ./decoder.rb
```

__Sample Input/Output__

```
Encrypted Session Cookie?
NUZHbkJKSCsyM3FOL2p2Qld6VUtMWkMwRERFa1R6UUZvU2F5RDJzSlZQYzlWQUtrWjRQTXBTbVExaHkrQ05TTytBNlViQWNWdDRrNjRtV2FxbWkzL2pncUt1ZlBIYitvMFA5SFB6MDVsUzZTK1o1TjV6SkdXbHJNVTlLa1BubDNNM1NnT3lCY3JiRzZuR0JEUHh6RkhRelg4VVlUTlFsRXJlOWxQd0FHR3BLbUViS2FBSWEzTVhmV1lOcU5EZkdLL1cvYXhKNzgvbHJnVzZJbmM2SjJiZE82dHpBMkNRT3VacDZDeVRiaFdQbz0tLXNhT1VkQis3VnJzVWRGVjNidUQxdVE9PQ%3D%3D--bf19b413465acc54352c23db37fc8d501c5c83ae
Secrete Key Base?
6f3eded16f0d7899c767e05d22dfda620a6ab665438d35320dadf001e7d0505995bf2e4fd8b5b3c7086131cbbfb37739a81f627148f227a06dcced9e223b09dc

Session:
{"session_id":"c66ddca6071d45e71d968af368c3223e","_csrf_token":"lC2/HDDbx99euOOc8d3Ulyr5InQ8A0mUBT9iBl6MsKo=","warden.user.user.key":[[1],"$2a$10$N8tXw/Gbv9XpxhRQmiRqq."]}
```

### Credit

The ruby code for the decoder was adopted from [this gist](https://gist.github.com/pdfrod/9c3b6b6f9aa1dc4726a5) by [pdfrod on github](https://github.com/pdfrod).