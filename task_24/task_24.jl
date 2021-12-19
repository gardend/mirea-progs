#Найти площадь наибольшей прямоугольной перегородки

function ugol(r,side1,side2)
    while !isborder(r,side1) || !isborder(r,side2)
        if !isborder(r,side1)
            move!(r,side1)
        else
            move!(r,side2)
        end
    end
end

function back(r, side)
    c = 1
    while c != 0
        if !isborder(r, side)
            move!(r, side)
        else
            c = obhod(r,side)
            if c == 0
                break
            end
        end
    end
end

function obhod(r,side)
    k = 0
    while (isborder(r,side) && !isborder(r,next_side(side)))
        move!(r,next_side(side))
        k += 1
    end
    if isborder(r,next_side(side))&&isborder(r,side)
        for i in 1:k
            move!(r,reverse(next_side(side)))
        end
        return 0
    end
    if !isborder(r,side)
        move!(r,side)
    end
    if k != 0
        while isborder(r,reverse(next_side(side)))
            move!(r,side)
        end
        for i in 1:k
            move!(r,reverse(next_side(side)))
        end
    end
    return 1
end

function S(r)
    n = 0
    while isborder(r, Nord)
        move!(r, Ost)
        n += 1
    end
    move!(r,Nord)
    m = 0
    while isborder(r, West)
        move!(r, Nord)
        m += 1
    end
    for i in 1:(m+1)
        move!(r, Sud)
    end
    return (m*n)
end

        
function max_s(r)
    ugol(r, West, Sud)
    s = 0
    while !isborder(r, Nord)
        c = 1
        while c != 0
            if !isborder(r, Ost)
                move!(r, Ost)
                if isborder(r, Nord)
                    k = S(r)
                    if (k > s)
                        s = k
                    end
                end
            else
                c = obhod(r,Ost)
                if c == 0
                    break
                end
            end
        end
        move!(r, Nord)
        back(r,West)
    end
print(s)
end