inherited UserEditor: TUserEditor
  Caption = 'Editor de Usuarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited mainPanel: TPanel
    Align = alBottom
    object userDataGB: TGroupBox
      Left = 1
      Top = 1
      Width = 482
      Height = 88
      Align = alTop
      Caption = ' Datos Usuario '
      TabOrder = 0
      DesignSize = (
        482
        88)
      object lblNombre: TcxLabel
        Left = 18
        Top = 31
        Caption = 'Nombre:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtNombre: TcxTextEdit
        Left = 69
        Top = 27
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnKeyUp = textKeyUp
        Width = 148
      end
      object lblApellido: TcxLabel
        Left = 17
        Top = 54
        Caption = 'Apellido:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtApellido: TcxTextEdit
        Left = 69
        Top = 54
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnKeyUp = textKeyUp
        Width = 148
      end
      object lblNroDoc: TcxLabel
        Left = 232
        Top = 28
        Anchors = [akTop, akRight]
        Caption = 'Nro. Documento:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtNroDoc: TcxMaskEdit
        Left = 323
        Top = 28
        Anchors = [akTop, akRight]
        Properties.BeepOnError = True
        Properties.EditMask = '00\.000\.000;1;_'
        Properties.OnValidate = txtNroDocPropertiesValidate
        TabOrder = 5
        Text = '  .   .   '
        OnKeyUp = textKeyUp
        Width = 95
      end
      object lblProfile: TcxLabel
        Left = 285
        Top = 55
        Anchors = [akTop, akRight]
        Caption = 'Perfil:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbProfile: TDBLookupComboBox
        Left = 323
        Top = 55
        Width = 145
        Height = 21
        Anchors = [akTop, akRight]
        KeyField = 'oid'
        ListField = 'nombre'
        ListSource = DSProfile
        TabOrder = 7
        OnExit = cmbProfileExit
        OnKeyUp = cmbProfileKeyUp
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 89
      Width = 482
      Height = 80
      Align = alTop
      Caption = ' Datos Cuenta '
      TabOrder = 1
      DesignSize = (
        482
        80)
      object lblUsuario: TcxLabel
        Left = 18
        Top = 28
        Caption = 'Usuario:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtUsuario: TcxTextEdit
        Left = 69
        Top = 27
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnKeyUp = textKeyUp
        Width = 148
      end
      object lblPassword: TcxLabel
        Left = 260
        Top = 22
        Anchors = [akTop, akRight]
        Caption = 'Password:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtPassword: TcxTextEdit
        Left = 320
        Top = 22
        Anchors = [akTop, akRight]
        ParentFont = False
        Properties.EchoMode = eemPassword
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnKeyUp = textKeyUp
        Width = 148
      end
    end
  end
  inherited cxButtonImageList: TcxImageList
    FormatVersion = 1
  end
  inherited BindingsList: TBindingsList
    Left = 264
    Top = 352
  end
  inherited BindScope: TBindScope
    Top = 352
  end
  inherited cxInternalCRUDImageList: TcxImageList
    FormatVersion = 1
  end
  inherited cxErrorImageList: TcxImageList
    FormatVersion = 1
  end
  object ZTProfile: TZTable
    Connection = ConnectionModule.ZConnection
    Active = True
    TableName = 'enduro.perfil_usuario'
    Left = 344
    Top = 136
  end
  object DSProfile: TDataSource
    DataSet = ZTProfile
    Left = 408
    Top = 136
  end
end
