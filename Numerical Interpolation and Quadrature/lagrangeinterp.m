% This program has the purpose of generating the lagrange basis to
% interpolate a given function. It receives one input: the abscissas xi as
% a vector X

function [p, L] = lagrangeinterp(x, f)
  if nargin ~= 2
      error('Function must receive two arguments only.')
  end
  
  if ~isvector(x) || ~isvector(f)
      error('Function must receive two vectors.')
  end
  
  if length(x) ~= length(f)
      error('Vectors dimensions must agree')
  end
  
  x = reshape(x, 1, length(x));
  f = reshape(f, length(f), 1);
  
  L = zeros(length(x));
  ind = [0 ones(1, length(x) - 1)] >=1;
  
  % Calculating the Lagrange basis
  for i = 1:length(x)
      num = poly(x(circshift(ind, i-1)));
      den = polyval(num, x(i));
      L(i, :) = num ./ den;
  end
  
  % Interpolation polynomial
  p = sum(repmat(f, 1, length(x)) .* L); 

end