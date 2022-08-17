codeunit 50110 "Threshold Setup Management" 
{
    procedure RunThresholdSetup(var thresholdSetupNotification :Notification)
    var
     ThresholdSetup:page "Threshold Setup";
     begin
        ThresholdSetup.Run();
     end;
}