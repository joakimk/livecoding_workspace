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

      animate()
      renderer.domElement

    animate = ->
      # Stop animating if a new live updated code version has arrived
      return if currentCodeVersion != window.liveCodeVersion
      requestAnimationFrame animate

      update()
      render()

      window.previousModelData = model

    update = ->
      delta = clock.getDelta()
      model.rotation.x += 8.5 * delta
      model.rotation.y -= 0.5 * delta
      #model.camera.z = 2.5
      #model.camera.z += 1 * delta
      #console.log(model.camera.z)

    render = ->
      mesh.rotation.x = model.rotation.x
      mesh.rotation.y = model.rotation.y
      camera.position.z = model.camera.z

      renderer.render scene, camera

    start()

window.Demo = Demo
