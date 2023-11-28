% rebase('ona/base.tpl', title='Base')

<p class="warning"></p>
<form method="POST" id="registration_form" style="margin: 1em">
    <label for="full_name">Full Name:</label>
    <input id="fullname_input" name="full_name" type="text" />
    <br>
    <label for="username">Username:</label>
    <input id="username_input" name="username" type="text" />
    <br>
    <label for="password">Password:</label>
    <input id="pass" name="password" type="password" />
    <br>
    <label for="password2">Confirm Password:</label>
    <input id="pass2" name="password2" type="password" />
    <br>
    <input type="hidden" id="names" value={{ member_names.replace(' ', '') }} />
    <input type="hidden" name="member_id" id="member_id" />
    <button>Submit</button>
</form>

<style>
    .warning {
        font-size: 0.8em;
        margin: 1em;
        color: red;
    }
</style>

<script>
    const raw_names = document.querySelector('#names').value
    const registered_names = JSON.parse(raw_names)
    document.querySelector('#member_id').value = registered_names.length + 1

    const handleRegistration = (event) => {
        const username = document.querySelector('#username_input').value
        const display_name = document.querySelector('#fullname_input').value
        const pass = document.querySelector('#pass').value
        const pass2 = document.querySelector('#pass2').value

        if (registered_names.includes(username)) {
            document.querySelector('p.warning').innerHTML = `Username ${username} Taken!`
            event.preventDefault()
        }

        if (display_name === "") {
            document.querySelector('p.warning').innerHTML = "No display name!"
            event.preventDefault()
        }

        if (pass !== pass2) {
            document.querySelector('p.warning').innerHTML = "Passwords do not match."
            event.preventDefault()
        }
    }

    document.querySelector('#registration_form').addEventListener("submit", handleRegistration)
</script>
