#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля, 
#дополнительно на поле могут находиться внутрение перегородки прямоугольной формы, 
#среди которых могут быть и вырожденые прямоугольники (отрезки), 
#эти внутренние перегородки изолированы друг от друга и от внешней рамки.
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы

function ugol(r,side1,side2)
    while !isborder(r,side1) || !isborder(r,side2)
        if !isborder(r,side1)
            move!(r,side1)
        else
            move!(r,side2)
        end
    end
end

function putmarker(r,side)
    k = 1
    while k != 0
        if isborder(r,side)
            k = obhod(r,side)
            if k == 0
                break
            end 
            putmarker!(r)       
        end
        if !isborder(r,side)
            move!(r,side)
            putmarker!(r)
        end
    end
end

function up(r)
    if isborder(r,Nord) == false
        move!(r,Nord)
        putmarker!(r)
    end
end

function mpole(r)
    ugol(r, Sud, Ost)
    putmarker!(r)
    while isborder(r,Nord) == false
        putmarker(r,West)
        up(r)
        putmarker(r,Ost)
        up(r)
    end
    if isborder(r,Ost) == false
        putmarker(r,Ost)
    elseif isborder(r,West) == false
        putmarker(r,West)
    end
end
