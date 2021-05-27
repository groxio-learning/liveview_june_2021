<%= for ball <- 1..8 do %>
<button phx-click="choose" phx-value-ball="<%= ball %>"><%= ball %></button>
<% end %>
<button phx-click="guess">Guess</button>
<pre>
<%= for row <- @game.rows do %>
  <%= render_guess(row.guess) %><%= render_score(row.score) %>
<% end %>
</pre>
<pre><%= inspect @game.status %></pre>
<pre><%= inspect @game %></pre>
<pre><%= inspect @move %></pre>
