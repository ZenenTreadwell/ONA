% rebase('ona/base.tpl', title='Base')
% setdefault('username', None)
<h1>{{ title }}</h1>
% if username:
<p>Logged in as {{ username }}</p>
% else:
<p>You are not logged in.</p>
% end
<a href="restricted">Restricted Link</a>
<a href="register">Register</a>

% if username:
<a href="logout">Log Out</a>
% else:
<a href="login">Log In</a>
% end

