%%%inertia and mass
ms = 2.6; %%kilograms
lx = 10/100; %%meters
ly = 10/100; %%meters
lz = 20/100; %%meters

max_moment_arm = max([lx,ly,lz]/2);
area1 = lx*ly; %%%Top face
area2 = ly*lz; %%Ram face
area3 = lx*lz; %%%Side face
max_area = max([area1,area2,area3]);


%%%Inertia of satellite in kg-m^2
Is = (ms/12)*[(lx^2+ly^2) 0 0 ;0 (lx^2+lz^2) 0;0 0 (ly^2+lz^2)];

%%%Call the reaction wheel params
reaction_wheel_params

%%%Add everything up
m = ms + 3*mr;
I = Is + Ir1Bcg + Ir2Bcg + Ir3Bcg;

%%%Invert the matrix
invI = inv(I);

