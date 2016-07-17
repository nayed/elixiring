area = fn {:circle, r} ->
    3.14159 * r * r
    {:rect, w, h} ->
        w * h
    end