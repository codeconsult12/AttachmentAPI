// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

page 50105 AttachmentAPI
{
    PageType = Card;
    Caption = 'Document Attachemnt API';
    //   APIPublisher = 'Deerfield';
    //   APIGroup = 'app';
    //   APIVersion = 'v1.0';
    //   EntityName = 'DocumentAttachment';
    //   EntitySetName = 'DocumentAttachment';
    SourceTable = "Incoming Document Attachment";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(IncomingDocumentEntryNo; "Incoming Document Entry No.")
                {
                    Caption = 'Entry No.';
                    //TableRelation = "Incoming Document";
                }
                field(Type; Type)
                {
                    Caption = 'Type';
                    OptionCaption = ' ,Image,PDF,Word,Excel,PowerPoint,Email,XML,Other';
                    //OptionMembers = " ",Image,PDF,Word,Excel,PowerPoint,Email,XML,Other;
                }
                field("FileExtension"; "File Extension")
                {
                    Caption = 'File Extension';

                    trigger OnValidate()
                    begin
                        case LowerCase("File Extension") of
                            'jpg', 'jpeg', 'bmp', 'png', 'tiff', 'tif', 'gif':
                                Type := Type::Image;
                            'pdf':
                                Type := Type::PDF;
                            'docx', 'doc':
                                Type := Type::Word;
                            'xlsx', 'xls':
                                Type := Type::Excel;
                            'pptx', 'ppt':
                                Type := Type::PowerPoint;
                            'msg':
                                Type := Type::Email;
                            'xml':
                                Type := Type::XML;
                            else
                                Type := Type::Other;
                        end;
                    end;
                }


                field("MainAttachment"; "Main Attachment")
                {
                    Caption = 'Main Attachment';
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UploadFile();
    end;

    local procedure UploadFile()
    var
        TempBlob: Codeunit "Temp Blob";
        FileMgt: Codeunit "File Management";
        InStr: InStream;
        OutStr: OutStream;
        FileName: Text;
    begin

        FileName := 'F:/IMG_0152.jpg';
        Content.Import(FileName);
        //        TempBlob.CreateInStream(InStr);
        //        Content.CreateOutStream(OutStr);
        //        CopyStream(OutStr, InStr);

    end;

    //        Content.Import('');
    //    end;
}
/*
page 50106 "Document Attachment"
{
    PageType = List;
    Caption = 'Document Attachemnt API';
    //   APIPublisher = 'Deerfield';
    //   APIGroup = 'app';
    //   APIVersion = 'v1.0';
    //   EntityName = 'DocumentAttachment';
    //   EntitySetName = 'DocumentAttachment';
    SourceTable = "Incoming Document Attachment";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(IncomingDocumentEntryNo; "Incoming Document Entry No.")
                {
                    Caption = 'Entry No.';
                    TableRelation = "Incoming Document";
                }
                field(Type; Type)
                {
                    Caption = 'Type';
                    OptionCaption = ' ,Image,PDF,Word,Excel,PowerPoint,Email,XML,Other';
                    //OptionMembers = " ",Image,PDF,Word,Excel,PowerPoint,Email,XML,Other;
                }
                field("FileExtension"; "File Extension")
                {
                    Caption = 'File Extension';

                    trigger OnValidate()
                    begin
                        case LowerCase("File Extension") of
                            'jpg', 'jpeg', 'bmp', 'png', 'tiff', 'tif', 'gif':
                                Type := Type::Image;
                            'pdf':
                                Type := Type::PDF;
                            'docx', 'doc':
                                Type := Type::Word;
                            'xlsx', 'xls':
                                Type := Type::Excel;
                            'pptx', 'ppt':
                                Type := Type::PowerPoint;
                            'msg':
                                Type := Type::Email;
                            'xml':
                                Type := Type::XML;
                            else
                                Type := Type::Other;
                        end;
                    end;
                }
                field("Contents"; Content)
                {
                    Caption = 'Content';
                    //SubType = Bitmap;
                }
                field("MainAttachment"; "Main Attachment")
                {
                    Caption = 'Main Attachment';
                }
            }
        }
    }
}

*/
