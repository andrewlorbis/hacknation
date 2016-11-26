# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

table = $('#appTable').DataTable()
form = $('#appForm')
apply = $('#apply')
# table.columns(2).search(17).search(18).draw()
filteredData = table

form.on 'change', () ->
  pos = $('input[name="position"]:checked').val()
  if pos != ''
    table.columns(1).search(pos)
  stat = $('input[name="status"]:checked').val()
  if stat != ''
    table.columns(6).search(stat)
  console.log 'change!'


apply.on 'click', () ->
  filteredData.draw()
  console.log 'change2!'
