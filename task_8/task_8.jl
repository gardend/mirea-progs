#ДАНО: Робот - рядом с горизонтальной перегородкой (под ней), бесконечно продолжающейся в обе стороны, 
#в которой имеется проход шириной в одну клетку.
#РЕЗУЛЬТАТ: Робот - в клетке под проходом

function reverse(side)
    for i=0:3
        if side == HorizonSide(i)
            return HorizonSide(mod(i+2, 4))
        end
    end
end

function check_border(r, side, num) #двигает робота на num шагов и проверяет наличие прохода сверху
    for i in 1:num
        move!(r,side)
        if isborder(r,Nord) == false
            break
        end
    end
end

function nord_space(r)
    num = 1
    side = Ost
    while isborder(r,Nord) == true
        check_border(r,side,num)
        side = reverse(side)
        num += 1
    end
end
