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
      Width = 74
      Height = 13
      Caption = 'Email de Envio'
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
      Width = 73
      Height = 13
      Caption = 'Servidor SMTP'
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
      Width = 27
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Porta'
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
      Width = 72
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Criptografada'
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
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio'
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
      Width = 32
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Senha'
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
      Width = 67
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Autentica'#231#227'o'
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
      Width = 30
      Height = 13
      Caption = 'Nome'
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
    object edtUserName: TEdit
      Left = 10
      Top = 194
      Width = 269
      Height = 21
      CharCase = ecLowerCase
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
      Text = 'N'#227'o'
      Items.Strings = (
        'N'#227'o'
        'Sim')
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
      Width = 201
      Height = 17
      Caption = 'Solicitar Confirma'#231#227'o de Leitura'
      TabOrder = 8
    end
    object pnlHeaderConfiguracaoEmail: TPanel
      Left = 0
      Top = 0
      Width = 480
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '  Configura'#231#227'o'
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
      Width = 42
      Height = 13
      Caption = 'Assunto'
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
      Width = 93
      Height = 13
      Caption = 'Email Destinat'#225'rio'
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
      Width = 30
      Height = 13
      Caption = 'Nome'
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
      Width = 86
      Height = 13
      Caption = 'Nome (Opcional)'
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
      Width = 86
      Height = 13
      Caption = 'Nome (Opcional)'
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
      Width = 56
      Height = 13
      Caption = 'Mensagem'
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
    object mmBody: TMemo
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
      Caption = '  Destinat'#225'rio'
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
    object edtNomeCc: TEdit
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
    object edtNomeCco: TEdit
      Left = 255
      Top = 151
      Width = 245
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
    end
    object lbAnexo: TListBox
      Left = 10
      Top = 233
      Width = 489
      Height = 49
      Color = clBtnFace
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 9
      OnKeyDown = lbAnexoKeyDown
    end
    object btnEnviar: TButton
      Left = 338
      Top = 403
      Width = 161
      Height = 30
      Caption = 'Enviar'
      TabOrder = 10
      OnClick = btnEnviarClick
    end
    object btnAnexar: TButton
      Left = 416
      Top = 288
      Width = 83
      Height = 25
      Caption = 'Anexar'
      TabOrder = 11
      OnClick = btnAnexarClick
    end
  end
end
