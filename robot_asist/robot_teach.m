% clear;
% clc;
% %����������ģ��
%       %theta    d        a        alpha     offset
% L1=Link([0       250     150    -pi/2      0     ]); %�������˵�D-H����
% L2=Link([-pi/2    0      570     -pi         0     ]);
% L3=Link([0       0       150    pi/2      0     ]);
% L4=Link([0       650     0        -pi/2      0     ]);
% L5=Link([-pi/2      0        0        -pi/2      0     ]);
% L6=Link([0       -200     0        0         0     ]);
% robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','robot'); %�������ˣ�������ȡ��manman
% robot.plot([0,pi/2,0,0,pi,0]);%���������ģ�ͣ������������Ϊ���ʱ��theta��̬
% teach(robot);

% robot=SerialLink([L1 L2 L3],'name','robot'); %�������ˣ�������ȡ��manman
%   robot.plot([0,pi/2,0]);
% robot.plot([Th_1 Th_2 Th_3]);%���������ģ�ͣ������������Ϊ���ʱ��theta��̬
% Robot=SerialLink(L);
% Robot.name='RRR_Robot';
% Robot.plot([Th_1 Th_2 Th_3]);
 
% T=robot.fkine([0,pi/2,0]);


% b=num2str(floor(T(2,4)))
% c=num2str(floor(T(3,4)))


% % 
clear;
clc;
%����������ģ��
%       theta    d        a        alpha     offset
L1=Link([0       250     150    -pi/2      0     ]); %�������˵�D-H����
L2=Link([-pi/2    0      570     -pi         0     ]);
L3=Link([0       0       150    pi/2      0     ]);
L4=Link([0       650     0        -pi/2      0     ]);
L5=Link([-pi/2      0        0        -pi/2      0     ]);
L6=Link([0       -200     0        0         0     ]);
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','manman'); %�������ˣ�������ȡ��manman
theta=[0,pi/2,0,0,0,0];%ָ���Ĺؽڽ�
p=robot.fkine(theta);%fkine���⺯�����������Ǹ����Ĺؽڽ�theta������ĩ��λ��p
 q=robot.ikine(p);%ikine��⺯�����������Ǹ�����ĩ��λ��p�������ؽڽ�q
