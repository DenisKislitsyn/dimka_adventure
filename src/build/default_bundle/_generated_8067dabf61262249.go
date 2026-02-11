components {
  id: "game"
  component: "/screens/game/game.script"
}
embedded_components {
  id: "dog"
  type: "sprite"
  data: "default_animation: \"dog1\"\nmaterial: \"/builtins/materials/sprite.material\"\nsize {\n  x: 150.0\n  y: 150.0\n}\ntextures {\n  sampler: \"texture_sampler\"\n  texture: \"/assets/atlases/main.atlas\"\n}\n"
  scale {
    x: 0.7
    y: 0.7
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_KINEMATIC\nmass: 0.0\nfriction: 0.1\nrestitution: 0.5\ngroup: \"default\"\nmask: \"wall\"\nmask: \"finish\"\nembedded_collision_shape {\n  shapes {\n    shape_type: TYPE_SPHERE\n    position {\n    }\n    rotation {\n    }\n    index: 0\n    count: 1\n  }\n  data: 10.0\n}\n"
}
embedded_components {
  id: "pers"
  type: "sprite"
  data: "default_animation: \"dima\"\nmaterial: \"/builtins/materials/sprite.material\"\nsize {\n  x: 75.0\n  y: 75.0\n}\nsize_mode: SIZE_MODE_MANUAL\ntextures {\n  sampler: \"texture_sampler\"\n  texture: \"/assets/atlases/main.atlas\"\n}\n"
  position {
    x: 75.0
    y: -15.0
  }
}
