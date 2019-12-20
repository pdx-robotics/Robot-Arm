clc;
clear all;


%What is the position vector?
Link3_position=[164.11,-576.23,33.18];

%What is the force vector?
Link3_force=[-154.65,0,0]*9.81;

T=cross(Link3_position,Link3_force)*1000^-2

%Torque specs for the Ax12A: https://www.trossenrobotics.com/dynamixel-ax-12-robot-actuator.aspx

%What is the recommended stall torque for stable motions? 
T_stable=.750465;

syms c;

eqn=abs(T(3))*c==T_stable;

S=vpasolve(eqn,c)*100;

fprintf('The Links should have %4.2f percent infill.',S);