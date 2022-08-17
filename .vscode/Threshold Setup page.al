page 50110 "Threshold Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Threshold Setup ";
    InsertAllowed = false;
    DeleteAllowed = false;
    Caption = 'threshold setup';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("threshold 1 value"; rec."threshold 1 value")
                {
                    ApplicationArea = All;

                }
                field("threshold 1 style"; rec."threshold 1 style")
                {
                    ApplicationArea = all;
                }
                field("threshold 2 value"; rec."threshold 2 value")
                {
                    ApplicationArea = All;
                }
                field("threshold 2 style"; rec."threshold 2 style")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnClosePage()

    begin
        if not Get() then Insert();
    end;


}