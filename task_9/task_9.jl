#ДАНО: Где-то на неограниченном со всех сторон поле и без внутренних перегородок имеется единственный маркер. 
#Робот - в произвольной клетке поля.
#РЕЗУЛЬТАТ: Робот - в клетке с тем маркером.

function moves!(r,side,num)
    for i = 1:num 
        if !ismarker(r)
            move!(r,side)
        end
    end
end
function spiral(r)
    global num
    moves!(r,Nord,num)
    moves!(r,Ost,num)
    num += 1
    moves!(r,Sud,num)
    moves!(r,West,num)
    num += 1
end

function mfind(r)
    global num = 1
    while !ismarker(r)
        spiral(r)
    end
end
