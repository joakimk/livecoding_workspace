Cube =
  init: ->
    camera = null
    scene = null
    renderer = null
    geometry = null
    material = null
    mesh = null

    model =
      rotation:
        x: 0
        y: 0

      timeSinceStart: 0

    start = ->
      renderer = new THREE.CanvasRenderer()
      renderer.setSize window.innerWidth, window.innerHeight

      camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 10)
      camera.position.z = 3

      geometry = new THREE.CubeGeometry(1, 1, 1)
      material = new THREE.MeshBasicMaterial(
        color: 0x000000
        wireframe: true
        wireframeLinewidth: 2
      )

      mesh = new THREE.Mesh(geometry, material)

      scene = new THREE.Scene()
      scene.add mesh

      animate()
      renderer.domElement

    animate = ->
      requestAnimationFrame animate

      update()
      render()

    update = ->
      #Date.now() * 0.0005;
      #timeSinceStart += delta
      model.rotation.x = 7
      model.rotation.y = 10

    render = ->
      mesh.rotation.x = model.rotation.x
      mesh.rotation.y = model.rotation.y

      renderer.render scene, camera

    start()

module.exports =
  Cube: Cube
