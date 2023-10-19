#const dimension = 9.

%filled(X,Y,V) is a pre-filled cell (hint) with X the row, Y the column and V the value.
filled(4,4,9).filled(4,8,6).filled(5,2,8).filled(6,1,7).
filled(6,7,4).filled(7,2,4).filled(9,3,7).filled(9,8,4).

% The inequality constraints can all be written by using '<' (less than).
% The lessThan(X1,Y1,X2,Y2) constraint checks if the value at (X1,Y1) < (X2,Y2).
lessThan(1,3,1,2).lessThan(2,3,1,3).lessThan(2,2,2,3).lessThan(3,1,2,1).
lessThan(3,4,2,4).lessThan(2,4,1,4).lessThan(2,6,1,6).lessThan(1,8,2,8).
lessThan(2,8,3,8).lessThan(3,6,3,5).lessThan(3,7,4,7).lessThan(4,7,5,7).
lessThan(5,7,6,7).lessThan(5,9,4,9).lessThan(6,9,5,9).lessThan(6,8,6,9).
lessThan(5,8,5,7).lessThan(6,8,6,7).lessThan(7,8,6,8).lessThan(6,5,6,6).
lessThan(5,5,5,6).lessThan(5,4,5,5).lessThan(5,3,5,4).lessThan(5,1,5,2).
lessThan(6,3,5,3).lessThan(5,4,6,4).lessThan(6,1,7,1).lessThan(7,6,7,7).
lessThan(7,7,8,7).lessThan(8,7,9,7).lessThan(8,9,8,8).lessThan(9,9,8,9).
lessThan(9,5,9,6).lessThan(8,5,8,4).lessThan(8,1,9,1).lessThan(9,2,8,2).
lessThan(8,3,9,3).lessThan(9,4,9,3).lessThan(8,4,9,4).

% The possible numbers are between 1 and the dimension of the puzzle.
number(1..dimension).

% The cells that are pre-filled (given hints) are inserted in the solution
% c(X,Y,V) stands for the cell at location (X,Y) with value V.
c(X,Y,V) :- filled(X,Y,V).

% Latin square condition: all rows and columns must be different.
{ c(X,Y,N):number(N) } = 1 :- number(X),number(Y).
{ c(X,Y,N):number(X) } = 1 :- number(N),number(Y).
{ c(X,Y,N):number(Y) } = 1 :- number(N),number(X). 

% Inequality condition: all '<' constraints must hold.
:- c(X1,Y1,N1), c(X2,Y2,N2), lessThan(X1,Y1, X2,Y2), N1 >= N2.

#show c/3.
