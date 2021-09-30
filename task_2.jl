#ДАНО: Робот - в произвольной клетке поля (без внутренних перегородок и маркеров)
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промакированы

function kray(r,side) #функция перемещает робота к краю
    while isborder(r,side) == false
        move!(r,side)
    end
end

function mramka(r,side) #обходит по периметру и ставит марки
    while isborder(r,side) == false
        move!(r,side) 
        putmarker!(r)
    end
end

function ramka(r)
    kray(r,Sud)
    kray(r,Ost) #ведет робот в угол
    for side in (HorizonSide(i) for i=0:3)
        mramka(r,side)
    end
end
