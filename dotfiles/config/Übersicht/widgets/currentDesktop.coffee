command: "echo $(/usr/local/bin/chunkc tiling::query -d id)"

refreshFrequency: 100

render: (output) ->
  """
    <div class="currentDesktop-container">
      <ul>
      <li id="desktop1"></li>
      <li id="desktop2"></li>
      <li id="desktop3"></li>
      <li id="desktop4"></li>
      <li id="desktop5"></li>
      <li id="desktop6"></li>
      <li id="desktop7"></li>
      <ul>
    </div>
  """

style: """
  position: absolute
  top: 10px
  font: 12px "Font Awesome 5 Free", "Font Awesome 5 Free Regular", "Font Awesome 5 Free Solid", "Font Awesome 5 Brands", "Font Awesome 5 Brands Regular"
  color: #aaa
  background: #2d2d2d
  height: 24px
  width: 280px
  display: flex
  align-items: center
  border-radius: 0 5px 5px 0

  ul
    list-style: none
    margin: 0 0 0 10px
    padding: 0

  li
    display: inline
    margin: 0 10px

    img
      max-height: 20px
      max-width: 20px

  li.active
    color: #cd98cd
"""

update: (output, domEl) ->
  if ($(domEl).find('li.active').id isnt output)
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find('li#desktop' + output).addClass('active')
