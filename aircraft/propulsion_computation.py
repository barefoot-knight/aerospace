import numpy as np

print('Computing Propulsion of a RC Rotor')

rho = 1.225 ##Density of air
P = 10.*11.1 ##Extra 1.5 I think is for induced power
R = (8.0/(12*3.28*2)) ##Radius in meters for a 12.5 inch prop
A = np.pi*R**2
KV = 1400  ##KV rpm per volt from the data sheet 
V = 11.1  #voltage in the battery
omega_rpm = KV*V ##angular velocity in rpm
omega_rads = omega_rpm * 2*np.pi / 60.
print('Omega (RPM) = ',omega_rpm)
CP = P / (rho * A * omega_rads**3 * R**3)
print('CP = ',CP)
CT = (CP*np.sqrt(2))**(2.0/3.0)
print('CT = ',CT)
TN = 0.5*rho*A*(omega_rads**2)*(R**2)*CT
Tkg = TN/9.81
Tlbs = 2.2*Tkg
Tg = Tkg*1000
print('Thrust (g) = ',Tg)
print('Thrust (lbs) =',Tlbs)