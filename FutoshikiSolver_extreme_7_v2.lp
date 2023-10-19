#const dimension = 7.

%filled(X,Y,V) is a pre-filled cell (hint) with X the row, Y the column and V the value.
filled(2,6,6).filled(4,7,7).filled(7,3,5).

% The inequality constraints can all be written by using '<' (less than).
% The lessThan(X1,Y1,X2,Y2) constraint checks if the value at (X1,Y1) < (X2,Y2).
lessThan(3,1, 2,1).lessThan(2,1, 1,1).lessThan(1,2, 2,2).lessThan(1,4, 1,3).lessThan(1,3, 2,3).lessThan(1,6, 1,7).
lessThan(3,4, 2,4).lessThan(3,2, 4,2).lessThan(4,2, 4,1).lessThan(3,6, 4,6).lessThan(4,6, 4,5).lessThan(4,5, 4,4).
lessThan(5,4, 5,5).lessthan(5,6, 6,6).lessThan(5,2, 6,2).lessThan(6,2, 6,1).lessThan(5,3, 6,3).
lessThan(7,2, 7,1).lessThan(6,4, 7,4).lessThan(7,5, 7,6).

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
