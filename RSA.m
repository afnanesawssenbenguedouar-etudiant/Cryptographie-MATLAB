
clc;
clear;

p = input('Donner p : ');
q = input('Donner q : ');

% Calcul de n et phi
n = p*q;
phi = (p-1)*(q-1);

% Cle publique
d = input('Donner d : ');

if isprime(p) && isprime(q) && p~=q && gcd(d,phi)==1

    % Cle privee
    c = eucli_inver_mod(d,phi);

    % Message
    m = input('Donner le message : ','s');

    % Conversion en ASCII
    m = double(m);

    if all(m < n)

        % Chiffrement
        for i = 1:length(m)
            E(i) = powermod(m(i),d,n);
        end

        % Dechiffrement
        for i = 1:length(E)
            M(i) = powermod(E(i),c,n);
        end

        % Affichage
        disp('Message chiffre :');
        disp(E);

        disp('Message dechiffre :');
        disp(char(M));

        if isequal(M,m)
            disp('Transmission reussie');
        else
            disp('Transmission echouee');
        end

    else
        disp('Message invalide');
    end

else
    disp('Parametres invalides');
end
