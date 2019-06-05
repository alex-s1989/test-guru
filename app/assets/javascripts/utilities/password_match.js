document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.password-match')
  if (control) { control.addEventListener('input', validate) }
})

function validate() {

  var password = document.getElementById('user_password').value
  var password_con = document.getElementById('user_password_confirmation').value


  if (password_con.length != 0) {

    if (password == password_con) {
      document.querySelector('.octicon-thumbsdown').classList.add('hide')
      document.querySelector('.octicon-thumbsup').classList.remove('hide')
    } else {
      document.querySelector('.octicon-thumbsdown').classList.remove('hide')
      document.querySelector('.octicon-thumbsup').classList.add('hide')
    }
  } else document.querySelector('.octicon-thumbsdown').classList.add('hide')
}
