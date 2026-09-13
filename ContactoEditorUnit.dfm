inherited ContactEdit: TContactEdit
  Caption = 'Editor de Contactos'
  ClientHeight = 462
  ClientWidth = 546
  ExplicitWidth = 562
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited buttonPanel: TPanel
    Top = 425
    Width = 546
    ExplicitTop = 425
    ExplicitWidth = 546
    inherited btnAccept: TAeroButton
      Left = 444
      ExplicitLeft = 444
    end
    inherited btnCancel: TAeroButton
      Left = 344
      ExplicitLeft = 344
    end
  end
  inherited mainPanel: TPanel
    Width = 546
    Height = 384
    ExplicitWidth = 546
    ExplicitHeight = 384
    object userDataGB: TGroupBox
      Left = 1
      Top = 1
      Width = 544
      Height = 176
      Align = alTop
      Caption = ' Datos Contacto '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 9
      ExplicitTop = 11
      DesignSize = (
        544
        176)
      object lblNombre: TcxLabel
        Left = 12
        Top = 30
        Caption = 'Nombre:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
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
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 230
      end
      object lblApellido: TcxLabel
        Left = 324
        Top = 31
        Anchors = [akTop, akRight]
        Caption = 'Apellido:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtApellido: TcxTextEdit
        Left = 380
        Top = 27
        Anchors = [akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 148
      end
      object lblDireccion: TcxLabel
        Left = 6
        Top = 58
        Caption = 'Direcci'#243'n:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtDireccion: TcxTextEdit
        Left = 69
        Top = 55
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 459
      end
      object lblTelefono: TcxLabel
        Left = 20
        Top = 85
        Caption = 'Celular:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
      end
      object lblMail: TcxLabel
        Left = 28
        Top = 142
        Anchors = [akTop, akRight]
        Caption = 'Email:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
      end
      object txtMail: TcxTextEdit
        Left = 69
        Top = 141
        Anchors = [akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 7
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 286
      end
      object cmbProvincia: TDBLookupComboBox
        Left = 69
        Top = 111
        Width = 204
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'provincia'
        ListSource = DSProvincia
        ParentFont = False
        TabOrder = 5
        OnExit = cmbProvinciaExit
      end
      object lblProvincia: TcxLabel
        Left = 8
        Top = 112
        Caption = 'Provincia:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lblLocalidad: TcxLabel
        Left = 280
        Top = 112
        Anchors = [akTop, akRight]
        Caption = 'Localidad:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbLocalidad: TDBLookupComboBox
        Left = 343
        Top = 111
        Width = 185
        Height = 24
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'localidad'
        ListSource = DSLocalidad
        ParentFont = False
        TabOrder = 6
        OnExit = cmbLocalidadExit
      end
      object txtTelefono: TcxTextEdit
        Left = 69
        Top = 83
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 230
      end
      object lblTelFijo: TcxLabel
        Left = 330
        Top = 85
        Caption = 'Fijo:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
      end
      object txtTelefonoFijo: TcxTextEdit
        Left = 362
        Top = 83
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 166
      end
    end
    object notasGB: TGroupBox
      Left = 1
      Top = 177
      Width = 544
      Height = 206
      Align = alClient
      Caption = ' Notas '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object notasMemo: TcxMemo
        Left = 2
        Top = 16
        Align = alClient
        TabOrder = 0
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Height = 188
        Width = 540
      end
    end
  end
  inherited validationPanel: TPanel
    Top = 384
    Width = 546
    ExplicitTop = 384
    ExplicitWidth = 546
    inherited errorListView: TcxListView
      Width = 546
      ExplicitWidth = 546
    end
  end
  inherited cxButtonImageList: TcxImageList
    FormatVersion = 1
  end
  inherited cxInternalCRUDImageList: TcxImageList
    FormatVersion = 1
  end
  inherited cxErrorImageList: TcxImageList
    FormatVersion = 1
  end
  object ZTProvincia: TZTable
    Connection = ConnectionModule.ZConnection
    CachedUpdates = True
    TableName = 'provincias'
    Left = 32
    Top = 208
  end
  object DSProvincia: TDataSource
    DataSet = ZTProvincia
    Left = 32
    Top = 256
  end
  object DSLocalidad: TDataSource
    DataSet = ZTLocalidad
    Left = 104
    Top = 256
  end
  object ZTLocalidad: TZTable
    Connection = ConnectionModule.ZConnection
    CachedUpdates = True
    TableName = 'localidad'
    MasterFields = 'oid'
    MasterSource = DSProvincia
    LinkedFields = 'provincia_oid'
    Left = 104
    Top = 208
  end
end
