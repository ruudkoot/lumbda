local module = {}

function module.nill()
    return nil
end

function module.cons(x,xs)
    return {head = x, tail = xs}
end

function module.case(xs,f,g)
    if not xs then
        return nil
    else
        return g(xs.head, xs.tail)
    end
end

function module.show(xs)
    if not xs then
        return "[]"
    else
        return tostring(xs.head) .. ":" .. module.show(xs.tail)
    end
end

function module.map(f,xs)
    module.case(xs,
        nill,
        function(y,ys)
            module.cons(f(y), module.map(f,ys))
        end
    )
end

local function f(x)
    return 3 * x + 1
end
print(module.show({head=1,tail={head=2,tail={head=3,tail=nil}}}))
print(module.show(module.map(f, {head=1,tail={head=2,tail={head=3,tail=nil}}})))

return module
