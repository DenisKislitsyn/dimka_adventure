components {
  id: "map1"
  component: "/assets/tiles/map1.tilemap"
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "collision_shape: \"/assets/tiles/map1.tilemap\"\n"
  "type: COLLISION_OBJECT_TYPE_STATIC\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"\"\n"
  "mask: \"default\"\n"
  ""
}
