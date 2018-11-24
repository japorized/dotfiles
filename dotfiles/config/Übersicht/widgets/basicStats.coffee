command: '~/.bin/nerdStats'

refreshFrequency: 1000

render: (output) ->
  """
    <div class="basicStats-container">
      <span class="wifi-icon"></span>
      <span class="wifi-content"></span>&nbsp;&nbsp;|&nbsp;&nbsp;
      <span class="vol-icon"></span>
      <span class="vol-content"></span>
    </div>
  """

style: """
  position: absolute
  bottom: 10px
  right: 0
  color: #efefef
  background: #1c1c1c
  height: 24px
  width: 150px
  padding: 0 10px
  border-radius: 5px 0 0 5px
  display: flex
  align-items: center
  font: 12px "Helvetica Neue", "Font Awesome 5 Free", "Font Awesome 5 Free Regular", "Font Awesome 5 Free Solid", "Font Awesome 5 Brands", "Font Awesome 5 Brands Regular"

  span.wifi-icon
    margin-right: 5px

  span.vol-icon
    margin-right: 5px
"""

update: (output, domEl) ->
  values = output.split('@')

  wifi = values[0]
  vol = values[1]

  if vol == "muted"
    $(domEl).find('.vol-icon').html("")
    $(domEl).find('.vol-content').html('-')
  else
    $(domEl).find('.vol-icon').html("")
    $(domEl).find('.vol-content').html(vol + "%")

  $(domEl).find('.wifi-content').html(wifi)
