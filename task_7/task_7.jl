#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля (без внутренних перегородок)
#РЕЗУЛЬТАТ: Робот - в исходном положении,
#в клетке с роботом стоит маркер, и все остальные клетки поля промаркированы в шахматном порядкe


function moves!(r,side) #двигает робота и возвращает количество шагов
    num = 0
    while isborder(r,side) == false
        move!(r,side)
        num+=1
    end
    return num
end

function reverse(side)
    for i=0:3
        if side == HorizonSide(i)
            return HorizonSide(mod(i+2, 4))
        end
    end
end

function move_back!(r,side,num) #передвигает робота в сторону на число шагов
    for i = 1:num
        move!(r,side)
    end
end


function mark_chek(r, x_coord, y_coord, size) #проверка координаты на наличие маркера(size-размер отступа)
    if ((mod(x_coord,2*size) in 0:size-1)&&(mod(y_coord,2*size) in 0:size-1))
        putmarker!(r)
    end
    if ((mod(x_coord,2*size) in size:2*size-1)&&(mod(y_coord,2*size) in size:2*size-1))
        putmarker!(r)
    end
end

function chestt(r)  
    side = Ost
    y = moves!(r,West)
    x = moves!(r,Sud)
    num = 1
    while isborder(r,Nord) == false
        mark_chek(r,abs(x),abs(y),1)
        while isborder(r,side) == false
            move!(r,side)
            y -= num
            mark_chek(r,abs(x),abs(y),1)
        end
        move!(r,Nord)
        side = inverse(side)
        x -= 1
        num *= -1
    end
    mark_chek(r,abs(x),abs(y),1)
    while isborder(r,side)==false
        move!(r,side)
        y -= num
        mark_chek(r,abs(x),abs(y),1)
    end
    move_back(r,Nord,x)
    move_back(r,Ost,y)
end