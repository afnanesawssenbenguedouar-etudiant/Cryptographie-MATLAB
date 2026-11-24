
% Fonction de puissance modulaire
function r = powermod(a, b, p)
    r = 1;
    a = mod(a, p);

    while b > 0
        if mod(b, 2) == 1
            r = mod(r*a, p);
        end

        a = mod(a*a, p);
        b = floor(b/2);
    end
end
