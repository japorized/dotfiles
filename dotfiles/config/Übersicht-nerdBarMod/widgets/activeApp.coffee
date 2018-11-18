command: "sh ./scripts/getActiveApp.sh"

refreshFrequency: 1000

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./assets/colors.css">
    <link rel="stylesheet" type="text/css" href="./assets/fontawesome-all.min.css">
    <div class="activeApp"></div>
  """

style: """
  width: 100%
  position: absolute
  margin: 0 auto
  margin-top: 7px
  text-align: center
  font: 14px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif
  color: #fff
  font-weight: 700
"""

update: (output, domEl) ->
  $(domEl).find('.activeApp').html(output);
