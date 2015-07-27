# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    alert "The article was rated"

  updateCountdown()

  $("#content").change ->
    updateCountdown()
  $("#content").keyup ->
    updateCountdown()
  
  $.getJSON("/tags.json").done (data) ->
    for d in data
      $(".swit-content").html (index, html) ->
        tag = d.content.toString()
        html.replace new RegExp(tag + " "), "<a href='/tags/get_swits/" + tag + "/'>" + tag + "</a> "
        html.replace new RegExp(" " + tag), " <a href='/tags/get_swits/" + tag + "/'>" + tag + "</a>"

updateCountdown = ->
  remaining = 140 - $("#content").val().length
  jQuery(".countdown").text remaining + " characters remaining."