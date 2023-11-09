function s = task_104 ()

  function [y, dy] = f(x)
    y = x.^3 - x - 2;
    dy = 3 * x.^2 - 1;
  end
  x0 = 1;
  e = 0.0001;
  R = [];
  tangent = [];

  while true
      [y, dy] = f(x0);
      x1 = x0 - y / dy;
      R =[R; x1];
      tangent = [tangent; [x0, y, dy]];
      if abs(x0 - x1) < e
        break;
      end
      x0 = x1;
  end

   fprintf('%f\n', R(end));


  x = linspace(3, 1, 40);
  [y, dy] = f(x);
  y = f(x);
  plot (x, y, 'm');
  grid on;
  hold on;
  plot(R, f(R), 'rd');
  for i = 1 : length(R)
    x_tangent = R(i) - 1:0.01:R(i) + 1;
    y_tangent = tangent(i, 2) + tangent(i, 3) * (x_tangent - R(i));
    plot (x_tangent, y_tangent, 'b:');
  end

  xlabel('Values of x');
  ylabel('Function values');
  title('Newton Raphson Method');
  legend('f(x) ', 'Roots','Tangent Lines');


endfunction
