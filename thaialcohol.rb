require 'sinatra'

get '/' do
  @alcohol = [*11..13, *17..23].include?(Time.now.getlocal("+07:00").hour)
  erb :index
end

get '/*' do
  redirect '/'
end

__END__
@@ layout
<html>
  <head>
    <title>Can I buy alcohol in Thailand?</title>
  </head>
  <body>
    <div align="center">
      <%= yield %>
    </div>
  </body>
</html>

@@ index
<p style="font-size:10em;font-weight:bold">
  <%= @alcohol ? 'YES' : 'NO' %>
</p>
<p>
You can buy alcohol from 11:00-14:00 and 17:00-24:00,
not taking into account Buddhist holidays or election days.<br>
(<a href="http://faranginbangkok.com/2013/01/24/alcohol-in-thailand-when-you-can-buy-where-you-can-buy-when-you-can-drink-where-you-can-drink/">Info</a> / <a href="https://github.com/citizen428/alcoholinthailand">Code</a>)
</p>
