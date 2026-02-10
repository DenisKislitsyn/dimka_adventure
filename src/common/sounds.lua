
local signal = require 'ludobits.m.signal'

local M = {}

local SOUND_KEY = 'sound'
local is_sound_on = true

M.state_changed = signal.create('state_changed')

local sounds = {
	background = msg.url('main:/sounds#background'),
	button = msg.url('main:/sounds#button')
}

local function play(sound_id, complete)
	if is_sound_on and sound_id then
		sound.play(sound_id, nil, complete)
		return true
	end
end

function M.initialize()
	is_sound_on = true
	if is_sound_on then
		sound.play(sounds.background)
	end
end

function M.get_sound_state()
	return is_sound_on
end

function M.change_sound_state()
	is_sound_on = not is_sound_on
	if is_sound_on then
		sound.play(sounds.background)
	else
		sound.stop(sounds.background)
	end
	M.state_changed.trigger({ sound = is_sound_on })
end

function M.button_click()
	play(sounds.button)
end

function M.gameover()
	play(sounds.gameover)
end

function M.merge()
	play(sounds.merge)
end

function M.pull()
	play(sounds.pull)
end

return M
