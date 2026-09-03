within ;
package another
  model SimplePendulum

    parameter Real L = 1 "Pendulum length (m)";
    parameter Real g = 9.81 "Gravity (m/s2)";

    Real theta(start=0.5) "Pendulum angle (rad)";
    Real omega(start=0) "Angular velocity (rad/s)";

  equation

    der(theta) = omega;

    der(omega) = -(g/L)*sin(theta);

  end SimplePendulum;
end another;
