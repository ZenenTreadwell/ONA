% rebase('ona/base.tpl')
% setdefault('static_path', '/static/ona')
<!--
	Faction by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->

<section class="main">
    <section>

        <header>
            <h1>Welcome to "MY O.N.A"</h1>
            <p>
                Members Only Section
            </p>
        </header>

        <span class="image main"><img src="{{ static_path }}images/money2.jpg') }}" alt="" /></span>
            <p>
                Hello, <b>{{ account.get('display_name') }}</b> ({{ account.get('username') }}), you are member #{{ account.get('member_id') }}.
                You have successfully logged into the section of the Ontario Numismatic Association's website
                restricted to active members.
            </p>
        <p>The following private links are available:</p>
        <ul>
            <li><a href="#">Current list of educational presentations by London Numismatic Society</a></li>
            <li><a href="#">Current issues of the Ontario Numismatist</a></li>
            <li><a href="#">Past Convention Highlights</a></li>
            <li><a href="support">Club Support</a></li>
        </ul>
        <p>
            The Ontario Numismatic Association hope you enjoy this Members' only section of our website.
        </p>
    </section>
</section>

