function Uhat = KalmanFilter(U)
global lastSensorUpdate P Uhat K Rk Q

Rk = 0.096870399055571; %%noise covariance
H = 1.00; %%Measurement map scalar
Q = 3.674316744786691; %% initial estimated covariance



%% Begin
K = P*H/(H*P*H+Rk);

%% Update error Covriance
P = (1-K*H)*P+Q;
Uhat = Uhat + K*(U-H*Uhat); %% Update estimated