local object
local obj
minetest.register_on_joinplayer(function(player)
    object = player
end)

local MyEntity = {
    initial_properties = {
        hp_max = 100,
        physical = true,
        collide_with_objects = false,
        visual = "mesh",
        mesh = "character.b3d",
        collisionbox = {-0.35, 0, -0.35, 0.35, 1.8, 0.35},
        textures = {"character.png"},
        spritediv = {x = 1, y = 1},
        initial_sprite_basepos = {x = 0, y = 0},
    },

    message = "Default message",
}

function MyEntity:on_punch(puncher, time_from_last_punch, tool_capabilities, direction, damage)
    minetest.chat_send_player(puncher:get_player_name(), "Hit did " .. tostring(damage) .. " HP and was " .. tostring(time_from_last_punch) .. " since the last hit.\nOver 10 seconds, this would do " .. tostring(10/time_from_last_punch*damage) .. " HP.")
    obj:set_hp(100)
end

minetest.register_entity("damagetest:entity", MyEntity)


minetest.register_chatcommand("damageentity",{
    params = "",
    func = function()
        local pos = object:get_pos()
        obj = minetest.add_entity(pos, "damagetest:entity", nil)
    end,
})
