from flask import Blueprint, render_template, abort
from jinja2 import TemplateNotFound

from blueprints.auth.blueprint import login_required

ona = Blueprint('ona',__name__,template_folder='templates', static_folder='static', url_prefix='/ona')

@ona.route('/members')
@login_required
def members():
    try:
        return render_template('members.html')
    except TemplateNotFound:
        abort(404)

@ona.route('/')
def main_page():
    try:
        return render_template('index.html')
    except TemplateNotFound:
        abort(404)

@ona.route('/<page>')
def page(page="index"):
    try:
        return render_template(f'{page}.html')
    except TemplateNotFound:
        abort(404)
