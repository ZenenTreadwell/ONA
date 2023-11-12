from ingredients.bottle import Bottle, route, run, template, view, TEMPLATE_PATH, template, request, response, redirect, static_file
from ingredients.schnorr import tagged_hash
from ingredients.files import load_dir, make_file
import os

app = Bottle()

path = '/' # How to get to this module from the root
name = "ONA"
description = "Ontario Numismatic Association"

salt = "abcd1234"
members_dir = 'data/members/'
os.makedirs(members_dir, exist_ok=True)

restricted_paths = ['members']

TEMPLATE_PATH.append(f'potions/auth/views')
TEMPLATE_PATH.append(f'potions/ona/views')

# This handles all the static files in the given system...
# Until we get NGINX to take care of it.
@app.route('/static/<filepath:path>')
def static(filepath):
        return static_file(filepath, root=f'{os.getcwd()}/static')

@app.route('/<route>')
@view('ona/index.tpl')
def index(route):
    username = request.get_cookie("account", secret=salt)

    if route in restricted_paths:
        if username is None:
            response.set_cookie('flash', 'Please Log In', secret=salt)
            return redirect(f'{path}login')

    return template(f'ona/{route}.tpl', title="solar", static_path="/static/ona/", flash=None, username=username)

@app.route('/')
@view('ona/index.tpl')
def index():
    username = request.get_cookie("account", secret=salt)
    return dict(title="solar", static_path="/static/ona/", flash=None, username=username)

@app.get('/login')
@view('auth/form.tpl')
def login():
    username = request.get_cookie("account", secret=salt)
    flash = request.get_cookie("flash", secret=salt)
    response.delete_cookie('flash')
    return dict(title="Login", flash=flash, username=username)

@app.post('/login')
def check_login():
    username = request.forms.get('username')
    password = request.forms.get('password')
    phash = tagged_hash(salt, password.encode()).hex()

    members = load_dir(members_dir)
    user = None
    for member in members:
        member_name = member.metadata.get('name')

        # If we find a matching name, we check the passwords
        if (member_name == username):
            print('matched', username)
            member_pass = member.metadata.get('password_hash')
            print(member_pass, phash)
            if (member_pass == phash):
                user = member_name

    if user:
        response.set_cookie("account", user, secret=salt)
        return redirect(path)
    else:
        response.set_cookie('flash', 'Login Failed', secret=salt)
        return redirect(f'{path}login')

@app.get('/logout')
def login():
    response.delete_cookie("account")
    return redirect(path)

@app.get('/register')
@view('auth/form.tpl')
def register():
    return dict(title="Register")

@app.post('/register')
def register():
    username = request.forms.get('username')
    password = request.forms.get('password')
    phash = tagged_hash(salt, password.encode()).hex()
    metadata = {
        "name": username,
        "password_hash": phash
    }

    make_file(metadata, "", f'{members_dir}{username}')

    return redirect(path)

if __name__ == "__main__":
    app.run(host='localhost', port=8001, debug=True)
