pageextension 50110 "Cust.ledger Entries Ext" extends "Customer ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field(NumberofDaysExpired; NumberofDaysExpired)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number of Days Expired';
                ToolTip = 'the Number of days this entry is expired,based upon due Date and today.';
                StyleExpr = DaysExpiredStyle;
            }



        }
        // Add changes to page layout here
    }
    views
    {
        addfirst
        {
            view("Open Entries")
            {
                Caption = 'Open Entries';
                OrderBy = ascending("Due Date");
                Filters = where(Open = const(true));
                SharedLayout = false;
                layout
                {
                    movefirst(Control1; NumberofDaysExpired)
                    moveafter(NumberofDaysExpired; "Due Date")

                }
            }
        }

    }
    var
        NumberofDaysexpired: Integer;
        Daysexpiredstyle: Text;
        ThresholdSetup: Record "Threshold Setup ";

    trigger OnOpenPage()
    begin
        if not ThresholdSetup.Get() then begin
            ShowThresholdSetupNotification();
            Currpage.Update();
        end
    end;

    trigger OnAfterGetRecord()
    begin
        NumberofDaysexpired := Rec.GetNumberofDaysExpired();
        case NumberofDaysexpired Of
            ThresholdSetup."threshold 1 value" .. ThresholdSetup."threshold 2 value":
                Daysexpiredstyle := Format(ThresholdSetup."threshold 1 style");
            ThresholdSetup."threshold 2 value" .. 99999:
                Daysexpiredstyle := Format(ThresholdSetup."threshold 2 style");
            else
                Daysexpiredstyle := 'None';
        end;

    end;

    local procedure ShowThresholdSetupNotification()
    var
        ThresholdSetupNotificationn: Notification;
        ThresholdSetupNotification: Label 'You Need to Run the Threshold Setup';
        ThressholdSetupNotification: Label 'Click to open the Threshold Setup';
    begin
        ThresholdSetupNotificationn.Message('You Need to Run the threshold setup');
        ThresholdSetupNotificationn.AddAction('Click here to run the threshold set', Codeunit::"Threshold Setup Management ", 'Run ThresholdSetup');
        ThresholdSetupNotificationn.Sent();
    end;
}

