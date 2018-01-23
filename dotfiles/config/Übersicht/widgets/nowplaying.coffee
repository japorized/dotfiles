command: "sh ./scripts/mpd.sh"

refreshFrequency: '2s' # ms

render: (output) ->
  """
    <div class='nowplaying'></div>
  """

style: """
  color: #66d9ef
  font: 12px Hack
  left: 8px
  bottom: 12px
  width:850px
  height: 16px
  cursor: pointer;
"""

cutWhiteSpace: (text) ->
  text.replace /^\s+|\s+$/g, ""

update: (output, domEl) ->

   values = output.split('@')
   artist = @cutWhiteSpace(values[0])
   song = @cutWhiteSpace(values[1])
   elapsed = values[2]
   status = @cutWhiteSpace(values[3])
   trackCount = @cutWhiteSpace(values[4])

   if artist.length >= 25
     artist = artist.substring(0,24)
     artist = @cutWhiteSpace(artist)

   if song.length >= 25
     song = song.substring(0,24)
     song = @cutWhiteSpace(song)
     song = song + "…"

   # Create mpdHtmlString
   mpdHtmlString = "<span class='icon'></span>&nbsp;<span class='white'> (#{trackCount}) #{artist} - #{song}&nbsp</span>"

   emptySpace = (80 - artist.length - song.length - 3)

   elapsedCounter = parseInt(elapsed * emptySpace / 100 )
   remainingCounter = emptySpace - elapsedCounter - 1

   mpdHtmlString += "<span>"
   i = 0
   while i <= elapsedCounter
     i += 1
     mpdHtmlString += "●"

   mpdHtmlString += "</span>"
   mpdHtmlString += "<span class='grey'>"

   i = 0
   while i <= remainingCounter
     i += 1
     mpdHtmlString += "●"

   mpdHtmlString += "</span>"

   if artist != ""
     mpdHtmlString += "<span class='sicon prev'>&nbsp&nbsp</span>" + " "

     if status == "[playing]"
        mpdHtmlString += "<span class='sicon pause'></span>" + " "
     else
        mpdHtmlString += "<span class='sicon play'></span>" + " "

     mpdHtmlString += "<span class='sicon next'></span>"

   $(domEl).find('.nowplaying').html(mpdHtmlString)

   $(".pause").on "click", => @run "/usr/local/bin/mpc pause"
   $(".play").on "click",  => @run "/usr/local/bin/mpc play"
   $(".next").on "click",  => @run "/usr/local/bin/mpc next"
   $(".prev").on "click",  => @run "/usr/local/bin/mpc prev"
