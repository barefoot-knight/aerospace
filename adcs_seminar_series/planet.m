%%%%This will define all of our planet parameters

R = 6.371e6; %%meters
M = 5.972e24; %%kg
G = 6.67e-11;  %%%some SI unit
mu = G*M;
mag_field_coeff = 8.32e24; %%%nT*m^3
rhosl = 1.225; %%kg/m^3 density at sea-level
scale_height = 0.1354; %%density constant in km^-1
solar_rad_pressure = 4.5e-6; %%%solar radiation pressure in pascals