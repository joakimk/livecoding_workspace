# This is intended to be a example of demo using GNU rocket (https://github.com/kusma/rocket)
# to drive the visuals to be in sync with the music.

Demo =
  init: ->
    camera = null
    scene = null
    renderer = null
    geometry = null
    material = null
    mesh = null
    clock = null

    # This model is only used on first page load, after that you will
    # retain the data from previous versions of the code.
    defaultModel =
      camera:
        z: 2.5

      rotation:
        x: 0
        y: 0

    model = window.previousModelData or defaultModel
    currentCodeVersion = window.liveCodeVersion

    start = ->
      clock = new THREE.Clock()
      renderer = new THREE.CanvasRenderer()
      renderer.setSize window.innerWidth, window.innerHeight

      camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 10)

      geometry = new THREE.CubeGeometry(1, 1, 1)
      material = new THREE.MeshBasicMaterial(
        color: 0x224444
        wireframe: true
        wireframeLinewidth: 20
      )

      mesh = new THREE.Mesh(geometry, material)

      scene = new THREE.Scene()
      scene.add mesh

      startSync()

      animate()
      renderer.domElement

    animate = ->
      # Stop animating if a new live updated code version has arrived
      return if currentCodeVersion != window.liveCodeVersion
      requestAnimationFrame animate

      try
        update()
        render()
      catch error
        window.previousModelData = defaultModel
        window.location.reload()

      window.previousModelData = model

    update = ->
      delta = clock.getDelta()
      model.rotation.x += 4.5 * delta
      model.rotation.y -= 0.5 * delta
      #model.camera.z = 2.5
      #model.camera.z += 1 * delta
      #console.log(model.camera.z)

    render = ->
      mesh.rotation.x = model.rotation.x
      mesh.rotation.y = model.rotation.y
      camera.position.z = model.camera.z

      renderer.render scene, camera

    # WIP: syncing with GNU rocket
    startSync = ->
      syncDevice = new JSRocket.SyncDevice()
      BPM = 170
      ROWS_PER_BEAT = 8
      ROW_RATE = BPM / 60 * ROWS_PER_BEAT
      awesomeness = null

      color = null
      row = null

      syncDevice.setConfig(socketURL: "ws://127.0.0.1:1339")

      onSyncReady = ->
        awesomeness = syncDevice.getTrack("AmountOfAwesome")
        color = syncDevice.getTrack("Color")

      onSyncUpdate = (newRow) ->
        row = newRow
        console.log awesomeness: awesomeness.getValue(newRow),
                    color: color.getValue(newRow),
                    row: newRow

        # TODO: drive rocket though current audio time
        #row = _audio.currentTime * ROW_RATE
        #syncDevice.update(row)

      onPlay = ->
        #set tune.currentTime here
        console.log "[onPlay] time in seconds", row / ROW_RATE

      onPause = ->
        #pause tune
        console.log "[onPause] time in seconds", row / ROW_RATE

      syncDevice.init()

      syncDevice.on "ready", onSyncReady
      syncDevice.on "update", onSyncUpdate
      syncDevice.on "play", onPlay
      syncDevice.on "pause", onPause

      window.syncDevice = syncDevice

    start()

window.Demo = Demo
