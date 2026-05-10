ground_y = 180
dino_x = 30
gravity = 1
jump_v = 7
obs_speed = 3

dino_y = ground_y
dino_dy = 0
obs_x = 255
obs_y = ground_y
random = rand8

title = true
show_title

while true
  pad0 = pad_trigger 0
  if title
    if btn_a_pressed(pad0)
      hide_title
      title = false
      play_music 0
      dino_y = ground_y
      dino_dy = 0
      obs_x = 255
      obs_y = ground_y
    end
  else
    if dino_y >= ground_y && btn_a_pressed(pad0)
      play_sound 3, 0
      dino_dy = 0 - jump_v
    end

    dino_y += dino_dy
    dino_dy += gravity
    if dino_y >= ground_y
      dino_y = ground_y
      dino_dy = 0
    end

    obs_x -= obs_speed
    if obs_x < 0
      random = rand8
      while random >= 10
        random -= 10
      end
      obs_x = 220
      obs_y = ground_y - random

      random = rand8
      while random >= 10
        random -= 10
      end
      obs_speed = 2 + random
    end

    if obs_x - 8 < dino_x && dino_x < obs_x + 8
      if obs_y - 8 < dino_y && dino_y < obs_y + 8
        play_sound 1, 0
        stop_music
        title = true
        show_title
      end
    end

    wait_frame
    draw_arrow dino_x, dino_y
    draw_ruby obs_x, obs_y
  end
end
