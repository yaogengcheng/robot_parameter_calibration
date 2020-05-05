% clear;
% clc;
% %建立机器人模型
%       %theta    d        a        alpha     offset
% L1=Link([0       250     150    -pi/2      0     ]); %定义连杆的D-H参数
% L2=Link([-pi/2    0      570     -pi         0     ]);
% L3=Link([0       0       150    pi/2      0     ]);
% L4=Link([0       650     0        -pi/2      0     ]);
% L5=Link([-pi/2      0        0        -pi/2      0     ]);
% L6=Link([0       -200     0        0         0     ]);
% robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','robot'); %连接连杆，机器人取名manman
% robot.plot([0,pi/2,0,0,pi,0]);%输出机器人模型，后面的六个角为输出时的theta姿态
% teach(robot);

% robot=SerialLink([L1 L2 L3],'name','robot'); %连接连杆，机器人取名manman
%   robot.plot([0,pi/2,0]);
% robot.plot([Th_1 Th_2 Th_3]);%输出机器人模型，后面的六个角为输出时的theta姿态
% Robot=SerialLink(L);
% Robot.name='RRR_Robot';
% Robot.plot([Th_1 Th_2 Th_3]);
 
% T=robot.fkine([0,pi/2,0]);


% b=num2str(floor(T(2,4)))
% c=num2str(floor(T(3,4)))


% % 
clear;
clc;
%建立机器人模型
%       theta    d        a        alpha     offset
L1=Link([0       250     150    -pi/2      0     ]); %定义连杆的D-H参数
L2=Link([-pi/2    0      570     -pi         0     ]);
L3=Link([0       0       150    pi/2      0     ]);
L4=Link([0       650     0        -pi/2      0     ]);
L5=Link([-pi/2      0        0        -pi/2      0     ]);
L6=Link([0       -200     0        0         0     ]);
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','manman'); %连接连杆，机器人取名manman
theta=[0,pi/2,0,0,0,0];%指定的关节角
p=robot.fkine(theta);%fkine正解函数，根据我们给定的关节角theta，求解出末端位姿p
 q=robot.ikine(p);%ikine逆解函数，根据我们给定的末端位姿p，求解出关节角q
