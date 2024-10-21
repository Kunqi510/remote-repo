USING TiaProject.Direct_loading_TIADemo;
CONFIGURATION MyConfiguration
    TASK Main(Priority := 1);
    
    PROGRAM P1 WITH Main: MainProgram;
        
    VAR_GLOBAL
       speedAxisInstance : SpeedAxisControl:=(AxisCommand:=REF(PosAxisCommand));      
       PosAxisCommand : MotionCommand;    
    END_VAR
END_CONFIGURATION