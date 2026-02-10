local M = {}

M.need_pass = {
	'pasha', 'vika', 'dima', 'milana', 'nikita'
}
M.passed_yet = {}
M.perses_down = {
	'pasha', 'vika', 'dima', 'milana', 'nikita'
}
M.perses_up = {
	'pasha', 'vika', 'dima', 'milana', 'nikita'
}


local ACTION_TOUCH = hash('touch')

local normalize = vmath.normalize
local v_length = vmath.length

local set_position = go.set_position

function M.finish(to)
	table.insert(M.passed_yet, M.pers)
	msg.post('game:/go#monarch', 'finish')
	msg.post(M.maps[to-1], 'disable')

	M.player.direction.x = 0
	M.player.direction.y = 0
	
	M.player.pos = M.player.start_pos
	set_position(M.player.start_pos, M.player.go)
	
	msg.post(M.maps[to], 'enable')

	for i, v in ipairs(M.perses_up) do
		if v == M.pers then
			msg.post('/perses_up#' .. M.perses_down[i], 'enable')
			break
		end
	end

	sprite.play_flipbook('/player#dog', 'dog' .. to)
end

function M.init()
	M.player = {
		go = '/player',
		input_props = {
			touch = vmath.vector3(),
			direction = vmath.vector3(),
		},
		state = {
		}
	}

	M.player.pos = go.get_position(M.player.go)
	M.player.start_pos = go.get_position(M.player.go)
	M.player.direction = vmath.vector3()
	M.player.speed = 200

	M.player.contacts = {
		up = false,
		down = false,
		left = false,
		right = false,
	}

	M.maps = {
		'/map1',
		'/map2',
		'/map3',
		'/map4',
		'/map5',
	}
	for i=2, #M.maps do
		msg.post(M.maps[i], 'disable')
	end

	for i, v in ipairs(M.perses_up) do
		msg.post('/perses_up#' .. M.perses_down[i], 'disable')
	end
end

function M.set_pers(pers)
	sprite.play_flipbook('/player#pers', pers)
	M.pers = pers

	for i, v in ipairs(M.perses_down) do
		if v == pers then
			msg.post('/perses_down#' .. M.perses_down[i], 'disable')
			break
		end
	end
end

function M.update(dt)
	if v_length(M.player.direction) > 0 then
		if M.player.contacts.down and M.player.direction.y < 0 then
			M.player.direction.y = 0
		end
		if M.player.contacts.up and M.player.direction.y > 0 then
			M.player.direction.y = 0
		end
		if M.player.contacts.left and M.player.direction.x < 0 then
			M.player.direction.x = 0
		end
		if M.player.contacts.right and M.player.direction.x > 0 then
			M.player.direction.x = 0
		end

		M.player.contacts.up = false
		M.player.contacts.down = false
		M.player.contacts.left = false
		M.player.contacts.right = false
		
		M.player.pos = M.player.pos + M.player.direction * M.player.speed * dt
		set_position(M.player.pos, M.player.go)
	end
end

function M.final(max_total_mass)
end

function M.input(action_id, action)
	if action_id == ACTION_TOUCH then
		if action.pressed then
			-- get touch position
			M.player.input_props.touch.x = action.x
			M.player.input_props.touch.y = action.y
		end

		-- calculate direction
		M.player.input_props.direction.x = action.x 
		M.player.input_props.direction.y = action.y
		local normalized = normalize(M.player.input_props.direction - M.player.input_props.touch)
		if M.player.input_props.direction.x ~= M.player.input_props.touch.x then
			M.player.direction.x = normalized.x
		end
		if M.player.input_props.direction.y ~= M.player.input_props.touch.y then
			M.player.direction.y = normalized.y
		end

		if action.released then
			M.player.direction.x = 0
			M.player.direction.y = 0
		end
	end
end

return M