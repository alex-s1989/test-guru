document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.progress')

  if(control) {
    let progress = culculateProgress()
    let progressBar = document.querySelector('.progress-bar')
    progressBar.style.width = progress + '%'
    document.getElementById('label').innerHTML = Math.round(culculateProgress() * 1) + '%'
  }

  function culculateProgress() {
    let questionNumber = control.dataset.numberOfCurrentQuestion
    let questionsAmount = control.dataset.totalQuestions

    return (questionNumber - 1) / questionsAmount * 100
  }
})
