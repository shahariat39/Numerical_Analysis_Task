function name = task_103 ()

  function y = f(x)
    y = x.^3 - x - 2;
  end
  a = 1;
  b = 2;
  e = 0.0001;
  R = [];

  while (b - a ) / 2 > e
      c = (a * f(b) - b * f(a)) / (f(b) - f(a));
      R =[R; c];
      if f (c) == 0
        break;
      elseif f(a) * f(c) < 0
        b = c;
      else f(b) * f(c) < 0
        a = c;
      end
    end
   fprintf ('%f\n', R (end));


  x = linspace (1, 3, 30);
  y = f(x);
  plot (x, y, 'm');
  grid on;
  hold on;
  plot(R, f(R), 'rd');
  xlabel('Values of x');
  ylabel('Function values');
  title('Regula False Method');
  legend('f(x) ', 'Roots');


endfunction
