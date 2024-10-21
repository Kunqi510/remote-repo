
USING Siemens.Simatic.S71500.MotionControl.Native;

NAMESPACE TiaProject.Direct_loading_TIADemo
    TYPE
        MotionCommand : STRUCT
            enableAxis : BOOL;
            reset : BOOL;
            jogForward : BOOL;
            jogBackward : BOOL;
            velocitySetpoint : LREAL :=300.0;
            actualSpeed : LREAL;  
        END_STRUCT;
        
    END_TYPE

    CLASS SpeedAxisControl

        VAR PUBLIC
            AxisCommand : REF_TO MotionCommand;
        END_VAR

        VAR
            //initialization button
            IsInitialized : BOOL;
            //to object
            SpeedAxis : REF_TO TO_SpeedAxis;
            //instances for MC instructions
            _instPower : MC_Power;
            _instReset : MC_Reset;
            _instJog : MC_MoveJog;          
        END_VAR
       
        METHOD PUBLIC Initialize 
            VAR_INPUT
                _speedAxisRef : REF_TO TO_SpeedAxis;
            END_VAR
            IF IsInitialized THEN
                RETURN;
            ELSIF _speedAxisRef<> NULL THEN
                SpeedAxis := _speedAxisRef;
                IsInitialized := TRUE;
            END_IF;
        END_METHOD
        

        METHOD PUBLIC Execute
            //power on axis
            _instPower(Axis:=SpeedAxis^,enable:=AxisCommand^.enableAxis);
            //jog axis
            _instJog(Axis:=SpeedAxis^,JogForward := AxisCommand^.jogForward,
            JogBackward := AxisCommand^.jogBackward,velocity:=AxisCommand^.velocitySetpoint);
            //reset axis
            _instReset(Axis:=SpeedAxis^,Execute:=AxisCommand^.reset);
            //read actual speed
            AxisCommand^.actualSpeed := SpeedAxis^.Velocity;
        END_METHOD
    END_CLASS
END_NAMESPACE