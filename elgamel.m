clc;
clear;

p = input('Donner p : ');
g = input('Donner g : ');
cB = input('Donner cB : ');
k = input('Donner k : ');
m = input('Donner m : ','s');

% Cle publique de Bob
dB = powermod(g,cB,p);

% Chiffrement
r = powermod(g,k,p);
K = powermod(dB,k,p);
e = mod(m*K,p);

% Dechiffrement
Kinv = powermod(r,p-1-cB,p);

for i = 1:length(m)
    M(i) = mod(e(i)*Kinv,p);
end


fprintf('r = %d\n',r);
fprintf('e = %d\n',e);
fprintf('Message dechiffre = %d\n',M);

if M == m
    disp('Transmission reussie');
else
    disp('Transmission echouee');
end
disp('Message dechiffre :');
disp(char(M));