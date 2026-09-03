within ;
package Second_Class
  package Motor_Modeling

  end Motor_Modeling;

  model motor
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=0.5)
      annotation (Placement(transformation(extent={{-58,18},{-38,38}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-76,-78},{-56,-58}})));
    Modelica.Electrical.Analog.Basic.Inductor inductor(L=0.05)
      annotation (Placement(transformation(extent={{-12,18},{8,38}})));
    Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-66,4})));
    Modelica.Electrical.Analog.Basic.RotationalEMF emf annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={8,12})));
    Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.001)
      annotation (Placement(transformation(extent={{30,2},{50,22}})));
    Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,-16},{-100,24}})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b dulo
      "Flange of right shaft"
      annotation (Placement(transformation(extent={{90,2},{110,22}})));
  equation
    connect(resistor.n, inductor.p)
      annotation (Line(points={{-38,28},{-12,28}}, color={0,0,255}));
    connect(signalVoltage.n, ground.p) annotation (Line(points={{-66,-6},{-66,
            -28},{-66,-28},{-66,-58}}, color={0,0,255}));
    connect(inductor.n, emf.p)
      annotation (Line(points={{8,28},{8,22}}, color={0,0,255}));
    connect(emf.n, signalVoltage.n)
      annotation (Line(points={{8,2},{8,-6},{-66,-6}}, color={0,0,255}));
    connect(emf.flange, inertia.flange_a)
      annotation (Line(points={{18,12},{30,12}}, color={0,0,0}));
    connect(inertia.flange_b, dulo)
      annotation (Line(points={{50,12},{100,12}}, color={0,0,0}));
    connect(signalVoltage.v, u) annotation (Line(points={{-54,4},{-52,4},{-52,
            -34},{-96,-34},{-96,4},{-120,4}}, color={0,0,127}));
    connect(resistor.p, signalVoltage.p)
      annotation (Line(points={{-58,28},{-66,28},{-66,14}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-98,62},{94,-74}},
            lineColor={0,0,0},
            fillColor={255,85,85},
            fillPattern=FillPattern.HorizontalCylinder), Ellipse(
            extent={{-44,-72},{34,-100}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={255,85,85})}), Diagram(coordinateSystem(
            preserveAspectRatio=false), graphics={Rectangle(
            extent={{-100,60},{-98,60}},
            lineColor={0,0,255},
            fillColor={255,85,85},
            fillPattern=FillPattern.Solid)}));
  end motor;

  model MotorDrive
    motor motor1
      annotation (Placement(transformation(extent={{-2,14},{18,34}})));
    Modelica.Blocks.Continuous.PID PID
      annotation (Placement(transformation(extent={{-30,14},{-10,34}})));
    Modelica.Blocks.Sources.Step step(height=10, startTime=5)
      annotation (Placement(transformation(extent={{-94,14},{-74,34}})));
    Modelica.Blocks.Math.Feedback feedback
      annotation (Placement(transformation(extent={{-62,14},{-42,34}})));
    Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=100)
      annotation (Placement(transformation(extent={{28,16},{48,36}})));
    Modelica.Mechanics.Rotational.Components.Inertia inertia(J=5)
      annotation (Placement(transformation(extent={{56,16},{76,36}})));
    Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={78,6})));
  equation
    connect(PID.u, feedback.y)
      annotation (Line(points={{-32,24},{-43,24}}, color={0,0,127}));
    connect(motor1.u, PID.y) annotation (Line(points={{-4,24.4},{-8,24.4},{-8,
            24},{-9,24}}, color={0,0,127}));
    connect(motor1.dulo, idealGear.flange_a) annotation (Line(points={{18,25.2},
            {24,25.2},{24,26},{28,26}}, color={0,0,0}));
    connect(idealGear.flange_b, inertia.flange_a)
      annotation (Line(points={{48,26},{56,26}}, color={0,0,0}));
    connect(inertia.flange_b, angleSensor.flange) annotation (Line(points={{76,
            26},{78,26},{78,16},{78,16}}, color={0,0,0}));
    connect(step.y, feedback.u1)
      annotation (Line(points={{-73,24},{-60,24}}, color={0,0,127}));
    connect(angleSensor.phi, feedback.u2) annotation (Line(points={{78,-5},{78,
            -18},{-52,-18},{-52,16}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end MotorDrive;
  annotation (uses(Modelica(version="4.0.0")));
end Second_Class;
