$ ->
  c = $("#template1")[0]
  ctx = c.getContext("2d")
  draw('circle', ctx, 20, 20, 10, 0)
  draw('rect', ctx, 55, 20, 90, 60)
  draw('circle', ctx, 180, 20, 10, 0)


draw = (type, ctx, x, y, z, t, id) ->
  if type == 'circle'
    ctx.beginPath()
    ctx.arc(x, y, z, t, 2 * Math.PI)
    ctx.stroke()
    ctx.id = id
  if type == 'rect'
    ctx.beginPath()
    ctx.rect(x, y, z, t)
    ctx.stroke()
    ctx.id = id

window.draw_template = (type) ->
#  if type is "onet"
#    datapoints =
#      circle1: [
#        x: 60
#        y: 90
#        z: 50
#        t: 0
#      ],
#      rect: [
#        x: 150
#        y: 100
#        z: 500
#        t: 300
#      ],
#      circle2: [
#        x: 740
#        y: 90
#        z: 50
#        t: 0
#      ]
#
#  c = $("#main-canvas")[0]
#  ctx = c.getContext("2d")
#  draw('circle', ctx, datapoints.circle1[0]["x"], datapoints.circle1[0]["y"], datapoints.circle1[0]["z"],
#    datapoints.circle1[0]["t"], 'id1')
#  draw('rect', ctx, datapoints.rect[0]["x"], datapoints.rect[0]["y"], datapoints.rect[0]["z"],
#    datapoints.rect[0]["t"], 'id2')
#  draw('circle', ctx, datapoints.circle2[0]["x"], datapoints.circle2[0]["y"], datapoints.circle2[0]["z"],
#    datapoints.circle2[0]["t"], 'id3')
#
  $('#templ-container').show();

window.open_file = (f, index) ->
  $('#file_opener').click()
  _val = $(f).attr('id')
  $('#clicked').val(_val)
  $('#index').val(index)
