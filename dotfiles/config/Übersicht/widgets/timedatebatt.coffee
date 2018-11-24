command: '~/.bin/timedatebatt'

refreshFrequency: 1000

render: (output) ->
  """
    <div class="timedatebatt-container">
      <span class="timedate-icon"></span>
      <span class="timedate-content"></span>&nbsp;&nbsp;|&nbsp;&nbsp;
      <span class="bat-icon"></span>
      <span class="bat-content"></span>
    </div>
  """

style: """
  position: absolute
  top: 10px
  right: 0
  color: #efefef
  background: #1c1c1c
  height: 24px
  width: 180px
  padding: 0 10px
  border-radius: 5px 0 0 5px
  display: flex
  align-items: center
  font: 12px "Helvetica Neue", "Hack Nerd Font", "Font Awesome 5 Free", "Font Awesome 5 Free Regular", "Font Awesome 5 Free Solid", "Font Awesome 5 Brands", "Font Awesome 5 Brands Regular"

  span.timedate-icon
    margin-right: 5px

  span.bat-icon.charging
    margin-right: 5px
    color: #9d79d1

  span.bat-icon.low
    color: #f94f11

  span.bat-icon.critical
    color: #fc2a05
"""

update: (output, domEl) ->
  values = output.split('@')

  timedate = values[0]
  batStatus = values[1]
  batPerc = values[2]

  if batStatus == "AC"
    $(domEl).find('.bat-icon').removeClass('critical low').addClass('charging').stop().html("")
  else
    if batPerc < 20
      $(domEl).find('.bat-icon').addClass('critical').stop().removeClass('low')
    else if batPerc < 35
      $(domEl).find('.bat-icon').addClass('low')
    $(domEl).find('.bat-icon').removeClass('charging').stop().html("")

  $(domEl).find('.timedate-content').html(timedate)
  $(domEl).find('.bat-content').html(batPerc + "%")
