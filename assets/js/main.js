document.addEventListener(
  'DOMContentLoaded',
  (event) => {
    // eslint-disable-next-line no-undef
    particlesJS.load('particles-js', '/assets/json/particles.json', function () {
      console.log('particles.js loaded - callback')
    })
  },
  false
)
