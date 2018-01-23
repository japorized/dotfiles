command: "echo $(/usr/local/bin/chunkc tiling::query -d id)"

refreshFrequency: 1000

render: (output) ->
  """
    <div class="currentDesktop-container">
      <ul>
        <li id="desktop1"><img src="./assets/icons/firefox-symbolic.svg" /></li>
        <li id="desktop2"><img src="./assets/icons/code.svg" /></li>
        <li id="desktop3"><img src="./assets/icons/utilities-terminal-symbolic.svg" /></li>
        <li id="desktop4"><img src="./assets/icons/multimedia-audio-player.svg" /></li>
        <li id="desktop5"><img src="./assets/icons/system-file-manager-symbolic.svg" /></li>
      <ul>
    </div>
  """

style: """
  position: relative
  margin-top: 5px
  font: 14px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif
  color: #aaa
  font-weight: 700

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
    color: #ededed
    border-bottom: 2px solid #ededed
"""

update: (output, domEl) ->
  if ($(domEl).find('li.active').id isnt output)
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find('li#desktop' + output).addClass('active')

  $('#desktop1').on "click", => @run "/usr/local/bin/khd -p 'alt - 1'"
  $('#desktop2').on "click", => @run "/usr/local/bin/khd -p 'alt - 2'"
  $('#desktop3').on "click", => @run "/usr/local/bin/khd -p 'alt - 3'"
  $('#desktop4').on "click", => @run "/usr/local/bin/khd -p 'alt - 4'"
  $('#desktop5').on "click", => @run "/usr/local/bin/khd -p 'alt - 5'"
