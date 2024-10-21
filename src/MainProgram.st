USING TiaProject.Direct_loading_TIADemo;
USING Siemens.Simatic.S71500.MotionControl.Native;
PROGRAM MainProgram
    VAR_EXTERNAL
        speedAxisInstance : TiaProject.Direct_loading_TIADemo.SpeedAxisControl;
        PosAxisCommand : TiaProject.Direct_loading_TIADemo.MotionCommand;
    END_VAR
    
    VAR
        _SpeedAxis : DB_ANY := UINT#1; 
    END_VAR

    speedAxisInstance.Initialize(AsSpeedAxisRef(_SpeedAxis));
    speedAxisInstance.Execute();
    ;
END_PROGRAM