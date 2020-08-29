% Parameter for parts

% Base
base_height = 0.5; % m
base_width = 0.5; % m
base_thickness = 1; % mm
base = [base_height base_width base_thickness/1000];
base_col = [0.8 0.8 1]; % light_grey

% Pencil Plate
pencilP_height = 5; % cm
pencilP_width = 5; % cm
pencilP_thickness = 0.5; % cm
pencilP_holeD = 0.6; % cm
C = linspace(3*pi/2, -pi/2, 100);
pencilP_hole = [pencilP_holeD/2*cos(C); pencilP_holeD/2*sin(C)]';
pencilP_cs = [pencilP_width/2 pencilP_height/2; 
              -pencilP_width/2 pencilP_height/2; 
              -pencilP_width/2 -pencilP_height/2;
              0 -pencilP_height/2;
              pencilP_hole;
              0 -pencilP_height/2;
                 pencilP_width/2 -pencilP_height/2;];
pencilP_col = [0.5 0.9 0.5]; % light green
pencilP_limits_x = []; 

% Motor
motor_height = 56/1000; % m
motor_diamter = 25/1000; % m
motorDisplacement_x = 23/100; % m
motorDisplacement_y = 23/100; % m
motor_colA = [0.9 0.5 0.5]; % Light_Red
motor_colB = [0.5 0.5 0.9]; % Light_Blue

% Outer Frame
frame_out_height = motor_height;
frame_out_topThickness = 5/100; % cm --> m
frame_out_sideThickness = 1.5/100; % cm --> m
frame_out_bottomThickness = 2 * (base_height/2 - motorDisplacement_y); % m
frame_out_cs = [base_width/2 base_height/2;
                -base_width/2 base_height/2;
                -base_width/2 frame_out_bottomThickness - base_height/2;
                frame_out_sideThickness - base_width/2  frame_out_bottomThickness - base_height/2;
                frame_out_sideThickness - base_width/2  frame_out_bottomThickness - base_height/2 + frame_out_sideThickness;
                frame_out_sideThickness - base_width/2  base_height/2 - frame_out_topThickness;
                -frame_out_sideThickness + base_width/2  base_height/2 - frame_out_topThickness;
                -frame_out_sideThickness + base_width/2  frame_out_bottomThickness - base_height/2 + frame_out_sideThickness;
                frame_out_sideThickness - base_width/2  frame_out_bottomThickness - base_height/2 + frame_out_sideThickness;
                frame_out_sideThickness - base_width/2  frame_out_bottomThickness - base_height/2;
                base_width/2  frame_out_bottomThickness - base_height/2;
                ];
% Inner Frame
frame_in_height = 6/100; % m
frame_in_width = base_width - 2 * frame_out_sideThickness; % m
frame_in_thickness = 1/100; % m
frame_in_col = [0.8 0.4 0.15];
frame_in = [frame_in_width frame_in_height frame_in_thickness];
frame_in_cs = [frame_in_width/2 -frame_in_height/2;
               frame_in_width/2 frame_in_height/2;
               -frame_in_width/2 frame_in_height/2;
               -frame_in_width/2 -frame_in_height/2;
               %-frame_in_width/2 -frame_in_height/2;
                ];

cs = [];
%figure; hold on; axis equal;
%plot(cs(:,1), cs(:,2), 'Color', [0.6 0.6 0.6], 'Marker', '.',...
%'MarkerSize', 9, 'MarkerEdgeColor', [1 0 0]);

% Pulleys
pulley_height = 1/100; % m
pulley_diameterOut = 1/100; % m
pulley_pin_height = 1/100; % m
pulley_diameterInner = 2/1000; % m
    % Pulleys Motor A, Motor B connected to motor a/b
    % Pulleys A/B: Top Left Corner (TLC A/B), Top Right Corner (TRC A/B)
    % Top Pulleys
    x_out = motorDisplacement_x; % m
    y_out = 0.23; % m
    p_tlcA = [-x_out y_out 0];
    p_tlcB = [-x_out + pulley_diameterOut *1.5 y_out - pulley_diameterOut * 1.5 0];
    p_trcB = [x_out y_out 0];
    p_trcA = [x_out - pulley_diameterOut *1.5 y_out - pulley_diameterOut * 1.5 0];
    % Inner Frame Pulleys LeftTop, RightTop, LeftBottom, RightBottom
    inner_offsetX = x_out - pulley_diameterOut *1.5; % As to line up with tlcB / trcA
    inner_offsetY = 0.01;
    p_itlB = [-inner_offsetX frame_in_height/2-inner_offsetY 0];
    p_iblA = [-inner_offsetX-pulley_diameterOut/2 -frame_in_height/2+inner_offsetY 0];
    p_itrA = [inner_offsetX frame_in_height/2-inner_offsetY 0];
    p_ibrB = [inner_offsetX+pulley_diameterOut/2 -frame_in_height/2+inner_offsetY 0];
    % Pulley Ends
    end_stop_size = [0.8 0.5 1];
    PPX_offset = pencilP_width/100-0.01; % cm --> m
    %PPY_offset = pencilP_height/100; % cm --> m
    p_end_tlB = [-PPX_offset/2 frame_in_height/2-inner_offsetY-pulley_diameterOut/2 0];
    p_end_blA = [-PPX_offset/2 -frame_in_height/2+inner_offsetY+pulley_diameterOut/2 0];
    p_end_trA = [PPX_offset/2 frame_in_height/2-inner_offsetY-pulley_diameterOut/2 0];
    p_end_brB = [PPX_offset/2 -frame_in_height/2+inner_offsetY+pulley_diameterOut/2 0];
    
   