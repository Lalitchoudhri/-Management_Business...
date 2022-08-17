tableextension 50110 "Cust.ledger entry Ext" extends "Cust. Invoice Disc."
{
    procedure GetNumberofDaysExpired(): Integer
    var
    NumberofDays: Integer;
    begin
        if Today() <= "Due Date" then
           exit(0);
        NumberofDays := "Due Date" -  Today();
        exit(Abs(NumberofDays))
    end;
}