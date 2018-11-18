command: "sh ./scripts/wttrWeather.sh"

refreshFrequency: 60000

render: (output) ->
  """
    <span class="toggleWeather"><i class="fa">compass</i></span>
    <div class="wttrWeather"></div>
  """

style: """
  top: 6px
  right: 30px
  .wttrWeather
    position: fixed
    top: 35px
    right: 30px
    opacity: 0
"""

update: (output, domEl) ->
  $(domEl).find('.wttrWeather').html('<img src="./cache/weather.png" />')
  isWeatherVisible = false
  $('.toggleWeather').on "click", ->
    if isWeatherVisible
      $('.wttrWeather').css('opacity', '0')
      isWeatherVisible = false
    else
      $('.wttrWeather').css('opacity', '1')
      isWeatherVisible = true
