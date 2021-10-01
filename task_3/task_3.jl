#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы

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
function up(r)
    if isborder(r,Nord) == false
        move!(r,Nord)
        putmarker!(r)
    end
end

function mpole(r)
    kray(r,Sud)
    kray(r,Ost) #ведет робота в угол
    putmarker!(r)
    while isborder(r,Nord) == false
        moverobot(r,West)
        up(r)
        moverobot(r,Ost)
        up(r)
    end
    if isborder(r,Ost) == false
        moverobot(r,Ost)
    elseif isborder(r,West) == false
        moverobot(r,West)
    end
end
