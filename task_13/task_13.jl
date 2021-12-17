#ДАНО: Робот - в произвольной клетке ограниченного прямоугольной рамкой поля без внутренних перегородок и маркеров.
#РЕЗУЛЬТАТ: Робот - в исходном положении в центре косого креста (в форме X) из маркеров.

function reverse(side)
    for i=0:3
        if side == HorizonSide(i)
            return HorizonSide(mod(i+2, 4))
        end
    end
end

function next_side(side)
    for i=0:3
        if side == HorizonSide(i)
            return HorizonSide(mod(i+3,4))
        end
    end
end

function krest_13(r)
    side = Nord
    for i in 1:4
        while (isborder(r,side)||isborder(r,next_side(side))) == false
            move!(r,side)
            move!(r,next_side(side))
            putmarker!(r)
        end
        side = reverse(side)
        while ismarker(r)
            move!(r,side)
            move!(r,next_side(side))
        end
        side = reverse(next_side(side))
    end
    putmarker!(r)
end