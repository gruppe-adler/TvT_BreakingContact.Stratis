params ["_truck", ["_armorLevel", 1]];

/* wörks only for gaz66 142 */

if (_armorLevel == 1) then {
     // LEFT SIDE METAL     _leftMetal = "Land_TinWall_01_m_4m_v1_F" createVehicle [0,0,0];     _leftMetal attachto [_truck, [-1.2,-0.75,1.15]];      _leftMetal setVectorDirAndUp [[1,0,0],[0,0,-1]];
     // LEFT SIDE METAL II     _leftMetal2 = "Land_SlumWall_01_s_4m_F" createVehicle [0,0,0];     _leftMetal2 attachto [_truck, [-1.3,1,0.75]];      _leftMetal2 setVectorDirAndUp [[1,0,0],[0,0,-1]];
     // LEFT WOOD     _leftWood = "Land_Shoot_House_Wall_Long_Prone_F" createVehicle [0,0,0];     _leftWood attachto [_truck, [-1.1,-0.75,2.7]];       _leftWood setVectorDirAndUp [[1,0,0],[0,0,1]];
     // RIGHT SIDE WOOD     _rightWood = "Land_Shoot_House_Wall_Long_Crouch_F" createVehicle [0,0,0];     _rightWood attachto [_truck, [1.1,-0.75,2.5]];      _rightWood setVectorDirAndUp [[-1,0,0],[0,0,1]];
     // RIGHT SIDE METAL     _rightMetal = "Land_TinWall_01_m_4m_v1_F" createVehicle [0,0,0];     _rightMetal attachto [_truck, [1.15,-0.75,1.15]];      _rightMetal setVectorDirAndUp [[-1,0,0],[0,0,-1]];
     // RIGHT SIDE METAL II     _rightMetal2 = "Land_SlumWall_01_s_4m_F" createVehicle [0,0,0];     _rightMetal2 attachto [_truck, [1.25,1,0.75]];      _rightMetal2 setVectorDirAndUp [[-1,0,0],[0,0,-1]];
     // RIGHT SIDE PLANK     _rightPlank = "Land_Plank_01_4m_F" createVehicle [0,0,0];     _rightPlank attachto [_truck, [1.20,-1,1.2]];       _rightPlank setVectorDirAndUp [[0,2,1],[1,0,0]]; 
     // BACK WALL     _back = "Land_Shoot_House_Wall_Stand_F" createVehicle [0,0,0];     _back attachto [_truck, [0,-2.7,2.2]];      _back setVectorDirAndUp [[0,1,0],[0,0,1]];
     // FRONT WOOD     _front = "Land_Shoot_House_Wall_Prone_F" createVehicle [0,0,0];     _front attachto [_truck, [0,3,2.5]];         _front setVectorDirAndUp [[0,1,0],[0,0,1]];
     _truck setVariable ["BC_objectives_truckArmorElements", [     	_leftMetal,     	_leftMetal2,     	_leftWood,     	_rightWood,     	_rightMetal,     	_rightMetal2,     	_rightPlank,     	_back,     	_front     ]];

} else {          // RIGHT SIDE WOOD     _rightWood = "Land_Shoot_House_Wall_Long_Crouch_F" createVehicle [0,0,0];     _rightWood attachto [_truck, [1.1,-0.75,2.5]];      _rightWood setVectorDirAndUp [[-1,0,0],[0,0,1]];
     // LEFT WOOD     _leftWood = "Land_Shoot_House_Wall_Long_Prone_F" createVehicle [0,0,0];     _leftWood attachto [_truck, [-1.1,-0.75,2.7]];       _leftWood setVectorDirAndUp [[1,0,0],[0,0,1]];
     // LEFT METAL LONG     _leftMetal = "Land_BackAlley_02_l_1m_F" createVehicle [0,0,0];     _leftMetal attachto [_truck, [-1.2,-0.75,0.6]];       _leftMetal setVectorDirAndUp [[1,0,0],[0,1,0]];
     _leftMetal2 = "Land_BackAlley_02_l_1m_F" createVehicle [0,0,0];     _leftMetal2 attachto [_truck, [-1.2,1.1,0.5]];        _leftMetal2 setVectorDirAndUp [[1,0,0],[0,1,0]];
     // RIGHT METAL LONG     _rightMetal = "Land_BackAlley_02_l_1m_F" createVehicle [0,0,0];     _rightMetal attachto [_truck, [1.2,-0.75,0.6]];       _rightMetal setVectorDirAndUp [[-1,0,0],[0,1,0]];
     _rightMetal2 = "Land_BackAlley_02_l_1m_F" createVehicle [0,0,0];     _rightMetal2 attachto [_truck, [1.2,1.1,0.5]];        _rightMetal2 setVectorDirAndUp [[-1,0,0],[0,1,0]];
     // BACK WALL     _back = "Land_Shoot_House_Wall_Stand_F" createVehicle [0,0,0];     _back attachto [_truck, [0,-2.7,2.2]];      _back setVectorDirAndUp [[0,1,0],[0,0,1]];
     // FRONT WOOD     _front = "Land_Shoot_House_Wall_Prone_F" createVehicle [0,0,0];     _front attachto [_truck, [0,3,2.5]];         _front setVectorDirAndUp [[0,1,0],[0,0,1]];
     _front2 = "Land_SlumWall_01_s_2m_F" createVehicle [0,0,0];     _front2 attachto [_truck, [0,2.95,0.4]];          _front2 setVectorDirAndUp [[0,-1,0.9],[0,0,1]];
     _truck setVariable ["BC_objectives_truckArmorElements", [     	_rightWood,     	_leftWood,		     	_leftMetal,     	_leftMetal2,     	_rightMetal,     	_rightMetal2,     	_back,     	_front,     	_front2     ]];
};