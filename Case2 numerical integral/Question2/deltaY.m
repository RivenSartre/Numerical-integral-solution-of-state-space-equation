function [ delta ] = deltaY( y0,Y,N )
    for k=1:1:N
        delta(k) = Y(k)-y0(k);
    end
end