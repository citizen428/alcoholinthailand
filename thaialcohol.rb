require 'sinatra'

get '/' do
  @alcohol = [*11..14, *17..23].include?(Time.now.hour).getlocal("+07:00") ? 'YES' : 'NO'
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
  <%= @alcohol %>
</p>
<p>
(<a href="http://faranginbangkok.com/2013/01/24/alcohol-in-thailand-when-you-can-buy-where-you-can-buy-when-you-can-drink-where-you-can-drink/">Info</a>. Not taking into account Buddhist holidays or election days.)
</p>
