%For the coordinate system that you chose, the z direction was chosen as
%the face of the gear about which the torque is being applied. 

clc;
clear all;

%%What is the moment arm of the first motor with respect to the defined
%%coordinate axis? The units are in mm. 

m1_position=[-169.34,-306.92,-21.01];

%%What is the force vector for each AX-12A motor? The mass is in grams. The
%%mass for each motor was obtained from the following link: https://www.trossenrobotics.com/dynamixel-ax-12-robot-actuator.aspx
Ax_force_vector=[57.88,0,0]*9.81;


%%Position vector of the first motor cross the force. Refer to pictures if
%%you are confused about orientation. 

M1_P_cross_F=cross(m1_position,Ax_force_vector);

%%Let T1 equal the torque due to the motor closest to the center gear
%%(M1_F_cross_P)
                                                           T1=M1_P_cross_F;

%What is the moment arm of the leftover for link 1?
Link1_LeftOver_Position=[-169.63,-290.70,-13.80];

%What is the force vector for the leftover for link 1?
Link1_Force_Vector=[246.53,0,0]*9.81;


%%Position vector of the leftover of link 1 cross the force. Refer to
%%pictures if you are confused about the orientation. 
Link1_P_cross_F=cross(Link1_LeftOver_Position,Link1_Force_Vector);

%%Let T2 be equal to the torque due to Link1's left over mass;
                                                        T2=Link1_P_cross_F;
%%What is the moment arm of the second motor with respect to the
%%coordinate axis?
m2_position=[-164.14,-488.92,-26.50];

%%Position vector of the second motor cross the force. Refer to the
%%pictures if you are confused about the orientation.
M2_P_cross_F=cross(m2_position,Ax_force_vector);

%%Let T3 be equal to the torque due to motor 2. 
                                                           T3=M2_P_cross_F;
%%What is the position vector of link2's left over mass?
Link2_LeftOver_Position=[-175.73,-461.16,-25.73];

%What is the force vector for the leftover for link 2?
Link2_Force_Vector=[302.16,0,0]*9.81;

%%Position vector of Link 2 cross Force vector of Link 2. 
Link2_P_cross_F=cross(Link2_LeftOver_Position,Link2_Force_Vector);

%%Let T4 be equal to link 2's left over mass;
                                                        T4=Link2_P_cross_F;
%What is the position vector of link 3's left over mass?
Link3_LeftOver_Position=[-164.11,-576.23,-33.18];

%What is the force vector of link 3's left over mass?
Link3_Force_Vector=[154.65,0,0]*9.81;

%%Position vector of link 3 cross Force vector of link 3. 
Link3_P_cross_F=cross(Link3_LeftOver_Position,Link3_Force_Vector);

%%Let T5 be equal to Link 3's Position Vector cross Force Vector. 
                                                        T5=Link3_P_cross_F;

%What is the sum of all the torque with respect to the center gear?
%Please Note: I'm only interested in the torque about the z direction. 
Torque_Summation=(T1+T2+T3+T4+T5)*1000^-2;

%What is the recommended stall torque for stable motions? 
T_stable=2.0601;

syms c;

%%2.0601 represents half of the stall torque. 
eqn=(T1(3)+T3(3))*1000^-2+(T2(3)+T4(3)+T5(3))*1000^-2*c==T_stable;

S=vpasolve(eqn,c)*100;

fprintf('The Links should have %4.2f percent infill.',S);

