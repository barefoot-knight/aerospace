function [BfieldNav,pqrNav,ptpNav,kalmanNav] = Navigation(BfieldMeasured,pqrMeasured,ptpMeasured)
global BfieldNavPrev pqrNavPrev ptpNavPrev kalmanNavPrev kalmanNav

s = 0.3;

if sum(BfieldNavPrev) + sum(pqrNavPrev) + sum(ptpNavPrev) == 0
   BfieldNav = BfieldMeasured;
   pqrNav = pqrMeasured;
   ptpNav = ptpMeasured;
   kalmanNav = ptpMeasured;
else
    BiasEstimate = [0;0;0];
    BfieldNav = BfieldNavPrev*(1-s) + s*(BfieldMeasured-BiasEstimate);
    pqrBiasEstimate = [0;0;0];
    pqrNav = pqrNavPrev*(1-s) + s*(pqrMeasured-pqrBiasEstimate);
    ptpBiasEstimate = [0;0;0];
    ptpNav = ptpNavPrev*(1-s) + s*(ptpMeasured-ptpBiasEstimate);
    for c = 1:3
        kalmanNav(c)= KalmanFilter(ptpMeasured(c));
    end
end





BfieldNavPrev = BfieldNav;
pqrNavPrev = pqrNav;
ptpNavPrev = ptpNav;
kalmanNavPrev = kalmanNav;

