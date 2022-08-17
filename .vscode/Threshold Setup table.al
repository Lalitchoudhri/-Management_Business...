table 50101 "Threshold Setup "
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "primary key"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'primary key';

        }
        field(2; "threshold 1 value"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'threshold 1 value';
        }
        field(3; "threshold 2 value"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'threshold 2 value';
        }
        field(4; "threshold 1 style"; enum "style type")
        {
            DataClassification = ToBeClassified;
            Caption = 'threshold 1 value';
        }
        field(5; "threshold 2 style"; Enum "style type")
        {
            DataClassification = ToBeClassified;
            Caption = 'threshold 2 style';
        }
    }

    keys
    {
        key(PK; "primary key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}