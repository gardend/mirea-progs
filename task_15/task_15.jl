#ДАНО: Робот - в произвольной клетке поля. дополнительно на поле могут находиться внутрение 
#перегородки прямоугольной формы, среди которых могут быть и вырожденые прямоугольники (отрезки), 
#эти внутренние перегородки изолированы друг от друга и от внешней рамки.
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промакированы

function ugol(r,side1,side2)
    while !isborder(r,side1) || !isborder(r,side2)
        if !isborder(r,side1)
            move!(r,side1)
        else
            move!(r,side2)
        end
    end
end

function mramka(r,side) #обходит по периметру и ставит марки
    while isborder(r,side) == false
        move!(r,side) 
        putmarker!(r)
    end
end

function ramka(r)
    ugol(r, Sud, West)
    for side in [Nord, Ost, Sud, West]
        mramka(r,side)
    end
end