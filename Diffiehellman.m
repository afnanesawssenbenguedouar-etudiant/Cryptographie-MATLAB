
clear all
close all
clc

p = input('Donner p : ');
g = input('Donner g : ');
a = input('Donner la cle privee Alice a : ');
%b = input('Donner la cle privee Bob b : ');

% Verification de p
if ~isprime(p)
    disp('Erreur : p doit etre premier');
    return;
end

% Verification de g
if g <= 1 || g >= p
    disp('Erreur : g invalide');
    return;
end

% Calcul des cles publiques
%YA = powermod(g,a,p);
YB = powermod(g,b,p);

% Calcul des cles secretes
ZAB = powermod(YB,a,p)
%ZBA = powermod(YA,b,p)

% Affichage des resultats
fprintf('Cle publique Alice = %d\n', YA);
fprintf('Cle publique Bob = %d\n', YB);

% Verification
if ZAB == ZBA
    disp('Echange reussi');
else
    disp('Echange echoue');
end
