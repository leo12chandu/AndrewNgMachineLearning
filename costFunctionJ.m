## Copyright (C) 2017 chandra sekhar manginipalli
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} costFunctionJ (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: chandra sekhar manginipalli <leo12_chandu@chandra-sekhar-manginipallis-MacBook-Pro.local>
## Created: 2017-03-19

function J = costFunctionJ (X, y, theta)

m = size(X, 1);
predictions = X * theta;

sqrErrors = (predictions - y) .^ 2

disp(["There are ", num2str(m), " training sets."])
disp("predictions")
disp(predictions)


J = (1 / (2 * m)) * sum(sqrErrors);

endfunction
