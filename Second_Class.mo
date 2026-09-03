within ;
package Second_Class
  package Motor_Modeling

  end Motor_Modeling;

  model motor
    Modelica.Electrical.Analog.Basic.Resistor resistor
      annotation (Placement(transformation(extent={{-58,18},{-38,38}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-76,-78},{-56,-58}})));
    Modelica.Electrical.Analog.Basic.Inductor inductor
      annotation (Placement(transformation(extent={{-12,18},{8,38}})));
    Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-66,4})));
    Modelica.Electrical.Analog.Basic.RotationalEMF emf annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={8,12})));
    Modelica.Mechanics.Rotational.Components.Inertia inertia
      annotation (Placement(transformation(extent={{30,2},{50,22}})));
    Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,-16},{-100,24}})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b dulo
      "Flange of right shaft"
      annotation (Placement(transformation(extent={{90,2},{110,22}})));
  equation
    connect(signalVoltage.p, resistor.p)
      annotation (Line(points={{-66,-6},{-66,28},{-58,28}}, color={0,0,255}));
    connect(resistor.n, inductor.p)
      annotation (Line(points={{-38,28},{-12,28}}, color={0,0,255}));
    connect(signalVoltage.n, ground.p) annotation (Line(points={{-66,14},{-66,
            -28},{-66,-28},{-66,-58}}, color={0,0,255}));
    connect(inductor.n, emf.p)
      annotation (Line(points={{8,28},{8,22}}, color={0,0,255}));
    connect(emf.n, signalVoltage.n)
      annotation (Line(points={{8,2},{8,14},{-66,14}}, color={0,0,255}));
    connect(emf.flange, inertia.flange_a)
      annotation (Line(points={{18,12},{30,12}}, color={0,0,0}));
    connect(inertia.flange_b, dulo)
      annotation (Line(points={{50,12},{100,12}}, color={0,0,0}));
    connect(signalVoltage.v, u)
      annotation (Line(points={{-78,4},{-120,4}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end motor;

  model MotorDrive
    motor motor1
      annotation (Placement(transformation(extent={{-10,2},{10,22}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end MotorDrive;
  annotation (uses(Modelica(version="4.0.0")));
end Second_Class;
