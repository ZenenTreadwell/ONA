from ingredients.bottle import Bottle, template, TEMPLATE_PATH, request, response, redirect, view
from ingredients.schnorr import tagged_hash
from ingredients.files import make_file, load_dir
import os
import hashlib

app = Bottle()
path = '/auth/' # How to get to this module from the root
name = "auth"
description = "Login Functionality"
salt = "abcd1234"

members_dir = 'data/members/'

os.makedirs(members_dir, exist_ok=True)

TEMPLATE_PATH.append(f'potions/auth/views')

@app.get('/login')
@view('auth/form.tpl')
def login():
    flash = request.get_cookie("flash", secret=salt)
    response.delete_cookie('flash')
    return dict(title="Login", flash=flash)

@app.get('/logout')
def login():
    response.delete_cookie("account")
    return redirect(path)

logins = {}

@app.post('/login')
def check_login():
    username = request.forms.get('username')
    password = request.forms.get('password')
    phash = tagged_hash(salt, password.encode()).hex()

    members = load_dir(members_dir)
    print('getting logins')
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
        return redirect('/ona/')
    else:
        response.set_cookie('flash', 'Login Failed', secret=salt)
        return redirect(f'{path}login')

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
    print('password set for', username)

    return redirect(path)

@app.route('/restricted')
@view('auth/index.tpl')
def index():
    username = request.get_cookie("account", secret=salt)
    if username:
        return dict(title="Valid", username=username)
    else:
        response.set_cookie('flash', 'Please Log In', secret=salt)
        return redirect(f'{path}login')

@app.route('/base')
@view('auth/index.tpl')
def index():
    username = request.get_cookie("account", secret=salt)
    return dict(title="Auth Demo", username=username)
