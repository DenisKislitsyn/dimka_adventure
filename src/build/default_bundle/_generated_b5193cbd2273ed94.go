embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"bar\"\nmaterial: \"/builtins/materials/sprite.material\"\nsize {\n  x: 110.0\n  y: 110.0\n}\nsize_mode: SIZE_MODE_MANUAL\ntextures {\n  sampler: \"texture_sampler\"\n  texture: \"/assets/atlases/main.atlas\"\n}\n"
}
embedded_components {
  id: "label"
  type: "label"
  data: "size {\n  x: 128.0\n  y: 32.0\n}\noutline {\n  x: 0.023529412\n  y: 0.38431373\n  z: 0.6509804\n}\ntext: \"\\320\\262\\320\\277\\320\\265\\321\\200\\320\\265\\320\\264\\n\"\n  \"\"\nfont: \"/assets/fonts/font.font\"\nmaterial: \"/builtins/fonts/label-df.material\"\n"
  position {
    x: 1.576287
    y: 111.23681
  }
  scale {
    x: 0.4
    y: 0.4
  }
}
embedded_components {
  id: "sprite1"
  type: "sprite"
  data: "default_animation: \"laps1\"\nmaterial: \"/builtins/materials/sprite.material\"\nsize {\n  x: 1428.0\n  y: 1042.0\n}\ntextures {\n  sampler: \"texture_sampler\"\n  texture: \"/assets/atlases/main.atlas\"\n}\n"
  position {
    x: 2.389784
    y: 86.15763
    z: -0.01
  }
  scale {
    x: 0.15
    y: 0.1
  }
}
embedded_components {
  id: "sprite2"
  type: "sprite"
  data: "default_animation: \"laps2\"\nmaterial: \"/builtins/materials/sprite.material\"\nsize {\n  x: 1428.0\n  y: 1042.0\n}\ntextures {\n  sampler: \"texture_sampler\"\n  texture: \"/assets/atlases/main.atlas\"\n}\n"
  position {
    x: -4.508615
    y: 64.677124
    z: -0.01
  }
  scale {
    x: 0.25
    y: 0.25
  }
}
