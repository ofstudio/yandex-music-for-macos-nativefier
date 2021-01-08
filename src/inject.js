// add macOS draggable bar
const draggableBar = document.createElement('div')
draggableBar.id = 'macos-draggable-bar'
document.body.appendChild(draggableBar)


// add back button
const headerContainer = document.getElementsByClassName('head__left')[0]
if (headerContainer !== undefined) {
  const backButtonContainer = document.createElement('span')
  backButtonContainer.id = 'back-button-container'
  const backButton = document.createElement('a')
  backButton.id = 'back-button'
  backButtonContainer.appendChild(backButton)
  headerContainer.insertBefore(backButtonContainer, headerContainer.childNodes[0])
  backButton.addEventListener('click', () => window.history.back())
}
