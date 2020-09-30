object FrmSamples: TFrmSamples
  Left = 0
  Top = 0
  Caption = 'Samples'
  ClientHeight = 451
  ClientWidth = 1002
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 480
    Height = 445
    Align = alLeft
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      480
      445)
    object Label3: TLabel
      Left = 10
      Top = 83
      Width = 27
      Height = 13
      Caption = 'Email'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 10
      Top = 129
      Width = 62
      Height = 13
      Caption = 'Server SMTP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 357
      Top = 129
      Width = 21
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 357
      Top = 83
      Width = 51
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Encrypted'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 10
      Top = 175
      Width = 23
      Height = 13
      Caption = 'User'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 284
      Top = 175
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Password'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 402
      Top = 129
      Width = 25
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Auth'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 37
      Width = 29
      Height = 13
      Caption = 'Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object cbCriptocrafia: TComboBox
      Left = 357
      Top = 102
      Width = 112
      Height = 21
      Anchors = [akTop, akRight]
      ItemIndex = 0
      TabOrder = 2
      Text = 'SSL'
      Items.Strings = (
        'SSL'
        'TSL')
    end
    object edtUser: TEdit
      Left = 10
      Top = 194
      Width = 269
      Height = 21
      TabOrder = 6
    end
    object edtPassword: TEdit
      Left = 285
      Top = 194
      Width = 185
      Height = 21
      PasswordChar = '*'
      TabOrder = 7
    end
    object edtHost: TEdit
      Left = 10
      Top = 148
      Width = 341
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 3
    end
    object edtPort: TEdit
      Left = 357
      Top = 148
      Width = 40
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 4
    end
    object edtFrom: TEdit
      Left = 10
      Top = 102
      Width = 341
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 1
    end
    object cbAuth: TComboBox
      Left = 403
      Top = 148
      Width = 67
      Height = 21
      Anchors = [akTop, akRight]
      ItemIndex = 0
      TabOrder = 5
      Text = 'No'
      Items.Strings = (
        'No'
        'Yes')
    end
    object edtNameFrom: TEdit
      Left = 10
      Top = 56
      Width = 459
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object chkReceiptRecipient: TCheckBox
      Left = 10
      Top = 228
      Width = 143
      Height = 17
      Caption = 'Request read confirmation'
      TabOrder = 8
    end
    object pnlHeaderEmailConfiguration: TPanel
      Left = 0
      Top = 0
      Width = 480
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '  Configuration'
      Color = 7039851
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 489
    Top = 3
    Width = 510
    Height = 445
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      510
      445)
    object Label2: TLabel
      Left = 10
      Top = 180
      Width = 38
      Height = 13
      Caption = 'Subject'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 10
      Top = 36
      Width = 27
      Height = 13
      Caption = 'Email'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 255
      Top = 36
      Width = 29
      Height = 13
      Caption = 'Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 10
      Top = 83
      Width = 14
      Height = 13
      Caption = 'CC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 255
      Top = 83
      Width = 82
      Height = 13
      Caption = 'Name (optional)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 10
      Top = 132
      Width = 23
      Height = 13
      Caption = 'CCO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 255
      Top = 129
      Width = 82
      Height = 13
      Caption = 'Name (optional)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 10
      Top = 307
      Width = 45
      Height = 13
      Caption = 'Message'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtTo: TEdit
      Left = 10
      Top = 55
      Width = 239
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 0
    end
    object mmMessage: TMemo
      Left = 10
      Top = 326
      Width = 489
      Height = 71
      TabOrder = 3
    end
    object edtNameTo: TEdit
      Left = 255
      Top = 55
      Width = 245
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edtSubject: TEdit
      Left = 10
      Top = 199
      Width = 490
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 510
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '  Recipient'
      Color = 7039851
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
    end
    object edtCc: TEdit
      Left = 10
      Top = 102
      Width = 239
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 5
    end
    object edtNameCc: TEdit
      Left = 255
      Top = 102
      Width = 245
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
    end
    object edtCco: TEdit
      Left = 10
      Top = 151
      Width = 239
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 7
    end
    object edtNameCco: TEdit
      Left = 255
      Top = 151
      Width = 245
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
    end
    object lbAttachment: TListBox
      Left = 10
      Top = 233
      Width = 489
      Height = 49
      Color = clBtnFace
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 9
      OnKeyDown = lbAttachmentKeyDown
    end
    object btnSend: TButton
      Left = 338
      Top = 403
      Width = 161
      Height = 30
      Caption = 'Send'
      TabOrder = 10
      OnClick = btnSendClick
    end
    object btnAttachment: TButton
      Left = 416
      Top = 288
      Width = 83
      Height = 25
      Caption = 'Attachment'
      TabOrder = 11
      OnClick = btnAttachmentClick
    end
  end
end
