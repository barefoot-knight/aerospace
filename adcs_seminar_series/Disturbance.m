function Mtotal = Disturbance(alt,vel,BI,BNED)

inertia;
planet;

%%%Compute Density
rho = rhosl*exp(-scale_height*(alt-REarth)/1000);

%%%Compute Aero Force
v = norm(vel);
Faero = 0.5*rho.*(v.^2)*max_area*CD;

%%%Aero Moment
Maero = Faero*max_moment_arm;	

%%%Compute Gravity at the bottom and top
bottom = alt - max_moment_arm/2;
top = alt + max_moment_arm/2;
accel_bottom = (G*MEarth)./(bottom.^2);
accel_top = (G*MEarth)./(top.^2);
delta_accel = (accel_bottom-accel_top);
force_delta = delta_accel * ms;
Mgrav = force_delta * max_moment_arm;

solar_rad_force = solar_rad_pressure*max_area;
Mrad = 0*alt + solar_rad_force*max_moment_arm;

BInorm = norm(BI);
BNEDnorm = norm(BNED);
dipole_moment = Mrad/(BNEDnorm*1e-9);
Mdipole = BInorm.*1e-9.*dipole_moment;

Mtotal = Maero + Mgrav + Mrad + Mdipole;






