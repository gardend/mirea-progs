#ДАНО: На ограниченном внешней прямоугольной рамкой поле имеется ровно одна внутренняя перегородка в форме прямоугольника. 
#Робот - в произвольной клетке поля между внешней и внутренней перегородками. 
#РЕЗУЛЬТАТ: Робот - в исходном положении и по всему периметру внутренней перегородки поставлены маркеры.

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

function next_side(side)
    for i=0:3
        if side == HorizonSide(i)
            return HorizonSide(mod(i+3,4))
        end
    end
end

function obvod(r)
    actions = []
    while ((isborder(r,Sud))&&(isborder(r,West))) == false
        push!(actions,moves!(r,West))
        push!(actions,moves!(r,Sud))
    end
    side = Nord
    while isborder(r,Ost) == false
        while isborder(r,side) == false
            move!(r,side)
            if isborder(r,Ost) == true
                break
            end           
        end
        if isborder(r,Ost) == false
            move!(r,Ost)
        end
        side = reverse(side)
    end
    while isborder(r,Ost)==true
        move!(r,Sud)
    end
    side = Nord
    for i in 1:4
        putmarker!(r)
        move!(r,side)
        while isborder(r,next_side(side)) == true
            putmarker!(r)
            move!(r,side)
        end
        side = next_side(side)
    end
    moves!(r,Sud)
    moves!(r,West)
    for i in 1:actions[2]
            move!(r,Nord)
    end
    for i in 1:actions[1]
         move!(r,Ost)
    end
end
