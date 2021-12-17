#ДАНО: Робот - в юго-западном углу поля, на котором расставлено некоторое количество маркеров
#РЕЗУЛЬТАТ: Функция вернула значение средней температуры всех замаркированных клеток

function check_temp(r) #функция возвращает температуру клетки + считает количество клеток с маркером
    global K
    if ismarker(r) == true
        K += 1
        return temperature(r)
    else
        return 0
    end
end

function sum_temp(r, side) #функция возвращает значение суммы температур всех клеток в направлении
    sum_temp = 0
    while isborder(r,side) == false
        sum_temp += check_temp(r)
        move!(r,side)
    end
    sum_temp += check_temp(r)
    return sum_temp
end

function reverse(side)
    for i=0:3
        if side == HorizonSide(i)
            return HorizonSide(mod(i+2, 4))
        end
    end
end

K = 0
function temp_corner(r)
    global K = 0
    temp = 0
    side = Ost
    while isborder(r,Nord) == false
        temp += sum_temp(r,side)
        move!(r,Nord)
        side = reverse(side)
    end
    temp += sum_temp(r,side)
    average_temp = temp/K
    return average_temp
end