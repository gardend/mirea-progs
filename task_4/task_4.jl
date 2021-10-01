#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и клетки поля промакированы так: нижний ряд - полностью, 
#следующий - весь, за исключением одной последней клетки на Востоке, следующий - за исключением двух 
#последних клеток на Востоке, и т.д.

function kray(r,side) #функция перемещает робота к краю
    while isborder(r,side) == false
        move!(r,side)
    end
end

function moverobot(r,side)
    while isborder(r,side) == false
        move!(r,side)
        putmarker!(r)
    end
end

function moveback(r,side)
    while ismarker(r) == true
        move!(r,side)
    end
    putmarker!(r)
end

function lesenka(r)
    kray(r,Sud)
    kray(r,West)
    putmarker!(r)
    moverobot(r,Ost)
    while isborder(r,Nord) == false
        move!(r,Nord)
        move!(r,West)
        moverobot(r,West)
        moveback(r,Ost)
    end
end