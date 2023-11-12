<!doctype html>
<!--
	Faction by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
% setdefault('title', "Ontario Numismatic Association")
% setdefault('static_path', '/static/ona/')
% setdefault('username', None)
% setdefault('flash', "")
<html>
	<head>
        <title>{{ title }}</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="{{ static_path }}assets/css/main.css" />
        <link rel="icon" href="{{ static_path }}images/favicon.png" />
	</head>

        <script>
            const headerShrink = () => {
                if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
                    document.querySelector(".image.logo").classList.remove("top");
                    document.querySelector("#header").classList.remove("top");
                } else {
                    document.querySelector(".image.logo").classList.add("top");
                    document.querySelector("#header").classList.add("top");
                }
            }

            window.onscroll = () => headerShrink()
        </script>

    <body class="is-preload">

        <!-- Header -->
        <header id="header" class="top">

            <!-- Logo -->
            <span class="logo">
                <div class="row aln-top aln-middle">
                    <img class="image logo top" src="{{ static_path }}images/logo.png" alt="">
                    <a href="/ona/">Ontario Numismatic Association</a>
                </div>
            </span>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li><a href="index">Home</a></li>
                    <li>
                        <a href="membership" class="icon solid fa-angle-down">Membership</a>
                        <ul>
                            <li><a href="membership">Benefits of Membership</a></li>
                            <li><a href="faq">Information</a></li>
                            <li><a href="library">Our Library</a></li>
                            <li><a href="membership">Membership Rates</a></li>
                            <li><a href="application">Join</a></li>
                            <li><a href="onlineRenewal">Renew Membership</a></li>
                            <li>
                                <a href="clubs">Member Clubs</a>
                                <ul>
                                    <li><a href="findAClub">Find a Club</a></li>
                                    <li><a href="profile">Update Your Profile</a></li>
                                    <li><a href="links">Links</a></li>
                                </ul>
                            </li>
                            <li><a href="members">My ONA</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="about" class="icon solid fa-angle-down">About Us</a>
                        <ul>
                            <li><a href="history">Our History</a></li>
                            <li><a href="executive">Executive Committee</a></li>
                            <li><a href="archive">Ontario Numistatist Archive</a></li>
                            <li><a href="constitution">Constitution and By-Laws</a></li>
                            <li><a href="conventionsList">Past Conventions</a></li>
                            <li>
                                <a href="awards">Awards</a>
                                <ul>
                                    <li><a href="awards">Recognition</a></li>
                                    <li><a href="bhr">Bruce H. Raszmann Award</a></li>
                                    <li><a href="merit">Award Of Merit</a></li>
                                    <li><a href="fellow">Fellow Award</a></li>
                                    <li><a href="coty">Club of the Year Award</a></li>
                                </ul>
                            </li>	
                        </ul>
                    </li>
                    <li><a href="contact">Contact Us</a></li>
                    % if username:
                    <li><a href="/logout" class="button">Log Out {{ username }}</a></li>
                    % else:
                    <li><a href="/login" class="button">Log In</a></li>
                    % end
                </ul>
            </nav>

        </header>

        <!-- Flashed Messages -->
        % if flash:
        <div class="box">{{ flash }}</div>
        % end

        <!-- Wrapper -->
        <div class="wrapper">

            % if defined('base'):
                {{ !base }}
            % else:
            <!-- Main -->
            <section class="main">
                <h1>Oops! This is only a base template.</h1>
                <p>You shouldn't be seeing this on the website.</p>
            </section>
            % end
        </div>

        <!-- Footer -->
        <footer id="footer">
            <div class="inner">
                <section class="info">
                    <h3>About Us</h3>
                    <div class="about">
                        <p> The O.N.A. executive team consists of an elected executive committee as well as an appointed body of regional directors and committee chairs.
                            We are here to serve our members.
                        </p>
                        <p>We could use a bit more information about the team here...</p>
                        <ul class="actions">
                            <li><a href="membership" class="button">Learn More</a></li>
                        </ul>
                    </div>
                    <div class="team">
                        <article>
                            <span class="image"><img src="{{ static_path }}images/pic06.jpg" alt=""></span>
                            <p>
                                <strong class="name">Sean Sinclair</strong>
                                <span class="title">ONA President</span>
                            </p>
                        </article>
                        <article>
                            <span class="image"><img src="{{ static_path }}images/pic07.jpg" alt=""></span>
                            <p>
                                <strong class="name">Cassidy Stroud</strong>
                                <span class="title">First Vice-President</span>
                            </p>
                        </article>
                        <article>
                            <span class="image"><img src="{{ static_path }}images/pic08.jpg" alt=""></span>
                            <p>
                                <strong class="name">Lisa McPherson</strong>
                                <span class="title">Second Vice-President</span>
                            </p>
                        </article>
                    </div>
                </section>
                <section class="contact">
                    <h3>Contact Us</h3>
                    <ul class="contact-icons">
                        <li class="icon solid fa-home"><a href="#">  P.O. Box 40033, RPO Waterloo Square, Waterloo, Ontario N2J 4V1, Canada</a></li>
                        <li class="icon solid fa-phone"><a href="#">1 (800) 555-0000 x12345</a></li>
                        <li class="icon solid fa-envelope"><a href="mailto:president@the-ona.ca">president@the-ona.ca</a></li>
                        <li class="icon brands fa-facebook"><a href="https://www.facebook.com/groups/7758175753/">Ontario Numismatic Association</a></li>
                        <!-- <li class="icon brands fa-twitter"><a href="#">twitter.com/untitled-tld</a></li> -->
                    </ul>
                </section>
            </div>
            <div class="copyright">
		    site made by <a href="https://zenen.space">zen</a>

                <!-- Scripts -->
                <script src="{{ static_path }}assets/js/jquery.min.js"></script>
                <script src="{{ static_path }}assets/js/jquery.dropotron.min.js"></script>
                <script src="{{ static_path }}assets/js/browser.min.js"></script>
                <script src="{{ static_path }}assets/js/breakpoints.min.js"></script>
                <script src="{{ static_path }}assets/js/util.js"></script>
                <script src="{{ static_path }}assets/js/main.js"></script>

    </body>
</html>
