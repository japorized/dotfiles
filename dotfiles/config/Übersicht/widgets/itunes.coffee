command: '/usr/local/bin/m itunes status | grep "Current track" | sed "s/Current track //g"'

refreshFrequency: 1000

render: (output) ->
  """
    <div class="itunes-container">
      <span class="itunes-icon"></span>
      <span class="itunes-content">#{output}</span>
    </div>
  """

style: """
  position: absolute
  bottom: 10px
  left: 0
  color: #efefef
  background: #1c1c1c
  height: 24px
  width: 500px
  padding: 0 10px
  border-radius: 5px 0 0 5px
  display: flex
  align-items: center
  font: 12px "Helvetica Neue", "Font Awesome 5 Free", "Font Awesome 5 Free Regular", "Font Awesome 5 Free Solid", "Font Awesome 5 Brands", "Font Awesome 5 Brands Regular"

  span.itunes-icon
    margin-right: 5px
"""
