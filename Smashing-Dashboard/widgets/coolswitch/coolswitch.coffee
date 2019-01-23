class Dashing.Coolswitch extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    console.log(data)
    $(@node).removeClass "csc_gray"
    $(@node).removeClass "csc_red"
    $(@node).removeClass "csc_green"

    if data.state.indexOf("OFF") == 0
        console.log("OFF")
        $(@node).addClass "csc_gray"

    else if data.state.indexOf("ON") == 0
        console.log("ON")
        $(@node).addClass "csc_green"

    else
        console.log("error")
        $(@node).addClass "csc_red"
