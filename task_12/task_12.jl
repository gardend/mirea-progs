#На прямоугольном поле произвольных размеров расставить маркеры в виде "шахматных" клеток,
#начиная с юго-западного угла поля, когда каждая отдельная "шахматная" клетка имеет размер n x n клеток поля 
#(n - это параметр функции). Начальное положение Робота - произвольное, конечное - совпадает с начальным. 
#Клетки на севере и востоке могут получаться "обрезанными" - зависит от соотношения размеров поля и "шахматных" клеток.
#(Подсказка: здесь могут быть полезными две глобальных переменных,
#в которых будут содержаться текущие декартовы координаты Робота относительно начала координат в левом нижнем углу поля, например)

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

function mark_chek(r, x_coord, y_coord, size) #проверка координаты на наличие маркера(size-размер отступа)
    if ((mod(x_coord,2*size) in 0:size-1)&&(mod(y_coord,2*size) in 0:size-1))
        putmarker!(r)
    end
    if ((mod(x_coord,2*size) in size:2*size-1)&&(mod(y_coord,2*size) in size:2*size-1))
        putmarker!(r)
    end
end

function move_back!(r,side,num) #передвигает робота в сторону на число шагов
    for i = 1:num
        move!(r,side)
    end
end

function move_coord!(r,side) #двигает робота и отсчитывает координаты
    global x_coord, y_coord
    if side == Nord
        y_coord += 1
    end
    if side == Sud
        y_coord -= 1
    end
    if side == Ost
        x_coord += 1
    end
    if side == West
        x_coord -= 1
    end
    move!(r,side)
end

function mark_move!(r, side) #функция двигает робота и ставит метки
    global x_coord, y_coord
    mark_chek(r, x_coord, y_coord, size)
    while isborder(r,side) == false
        move_coord!(r, side)
        mark_chek(r, x_coord, y_coord, size)
    end
end

function marking(r)
    mark_move!(r, Ost)
    side = West
    while isborder(r, Nord) == false
        move_coord!(r, Nord)
        mark_move!(r, side)
        side = reverse(side)
    end
end

x_coord = 0
y_coord = 0
size = 0
function chest_n(r, n) # - главная функция 
    global size, x_coord, y_coord
    size = n
    y = moves!(r, Sud)
    x = moves!(r, West)
    marking(r)
    move_back!(r, Sud, y_coord - y)
    move_back!(r, West, x_coord - x)
end

