inherited CategoriaEditor: TCategoriaEditor
  Caption = 'Editor de Categor'#237'as'
  ClientHeight = 496
  ClientWidth = 529
  Constraints.MinHeight = 250
  ExplicitWidth = 545
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited buttonPanel: TPanel
    Top = 459
    Width = 529
    ExplicitTop = 438
    ExplicitWidth = 529
    inherited btnAccept: TAeroButton
      Left = 427
      ExplicitLeft = 427
    end
    inherited btnCancel: TAeroButton
      Left = 327
      ExplicitLeft = 327
    end
  end
  inherited mainPanel: TPanel
    Width = 529
    Height = 418
    ExplicitWidth = 529
    ExplicitHeight = 397
    object gbDatosGenerales: TGroupBox
      Left = 1
      Top = 1
      Width = 527
      Height = 113
      Align = alTop
      Caption = ' Datos Generales '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        527
        113)
      object lblNombre: TcxLabel
        Left = 48
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
        Left = 105
        Top = 29
        OnFocusChanged = txtNombreExit
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
        Width = 399
      end
      object lblTipoCategoria: TcxLabel
        Left = 48
        Top = 57
        Anchors = [akTop, akRight]
        Caption = 'Tipo Categor'#237'a:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbTipoCategoria: TDBLookupComboBox
        Left = 141
        Top = 57
        Width = 217
        Height = 24
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'nombre'
        ListSource = DSTipoCategoria
        ParentFont = False
        TabOrder = 3
        OnExit = cmbTipoCategoriaExit
        OnKeyUp = cmbTipoCategoriaKeyUp
      end
      object chkUtilizaAcompaniante: TcxCheckBox
        Left = 48
        Top = 85
        OnFocusChanged = chkHandicupEdadFocusChanged
        Caption = 'Utiliza Acompa'#241'ante'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        OnClick = chkHandicupEdadClick
        OnExit = chkHandicupEdadExit
        Width = 142
      end
    end
    object gbNumeracion: TGroupBox
      Left = 1
      Top = 242
      Width = 527
      Height = 48
      Align = alTop
      Caption = ' Numeraci'#243'n de la Categor'#237'a '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      ExplicitTop = 225
      object lblInicial: TcxLabel
        Left = 42
        Top = 21
        Caption = 'Inicial:'
        ParentFont = False
        Style.BorderColor = clMenuHighlight
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuText
        Style.IsFontAssigned = True
        Properties.ShadowedColor = clMenuHighlight
      end
      object txtInicial: TcxCurrencyEdit
        Left = 85
        Top = 20
        OnFocusChanged = txtNombreExit
        ParentFont = False
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 134
      end
      object lblFinal: TcxLabel
        Left = 240
        Top = 21
        Caption = 'Final:'
        ParentFont = False
        Style.BorderColor = clMenuHighlight
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuText
        Style.IsFontAssigned = True
        Properties.ShadowedColor = clMenuHighlight
      end
      object txtFinal: TcxCurrencyEdit
        Left = 277
        Top = 20
        OnFocusChanged = txtNombreExit
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 134
      end
    end
    object gbValorSeguro: TGroupBox
      Left = 1
      Top = 114
      Width = 527
      Height = 80
      Align = alTop
      Caption = ' Valor Seguro '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitTop = 97
      DesignSize = (
        527
        80)
      object lblValorSeguro: TcxLabel
        Left = 57
        Top = 15
        Caption = 'Valor Seguro:'
        ParentFont = False
        Style.BorderColor = clMenuHighlight
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuText
        Style.IsFontAssigned = True
        Properties.ShadowedColor = clMenuHighlight
      end
      object txtValorSeguro: TcxCurrencyEdit
        Left = 141
        Top = 14
        OnFocusChanged = txtNombreExit
        ParentFont = False
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 104
      end
      object lblValorSeguroTexto: TcxLabel
        Left = 20
        Top = 46
        Caption = 'Texto Valor Seguro:'
        ParentFont = False
        Style.BorderColor = clMenuHighlight
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuText
        Style.IsFontAssigned = True
        Properties.ShadowedColor = clMenuHighlight
      end
      object txtValorSeguroTexto: TcxTextEdit
        Left = 141
        Top = 45
        OnFocusChanged = txtNombreExit
        Anchors = [akLeft, akTop, akRight]
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
        Width = 367
      end
    end
    object gbRangoEdades: TGroupBox
      Left = 1
      Top = 194
      Width = 527
      Height = 48
      Align = alTop
      Caption = ' Rango de Edades '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitTop = 177
      object lblMinima: TcxLabel
        Left = 35
        Top = 19
        Caption = 'M'#237'nima:'
        ParentFont = False
        Style.BorderColor = clMenuHighlight
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuText
        Style.IsFontAssigned = True
        Properties.ShadowedColor = clMenuHighlight
      end
      object txtMinima: TcxCurrencyEdit
        Left = 85
        Top = 18
        OnFocusChanged = txtNombreExit
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 134
      end
      object lblMaxima: TcxLabel
        Left = 224
        Top = 19
        Caption = 'M'#225'xima:'
        ParentFont = False
        Style.BorderColor = clMenuHighlight
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuText
        Style.IsFontAssigned = True
        Properties.ShadowedColor = clMenuHighlight
      end
      object txtMaxima: TcxCurrencyEdit
        Left = 277
        Top = 18
        OnFocusChanged = txtNombreExit
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 134
      end
    end
    object gbHandicup: TGroupBox
      Left = 1
      Top = 338
      Width = 527
      Height = 79
      Align = alClient
      Caption = ' C'#225'lculo de Handicup '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      ExplicitTop = 321
      ExplicitHeight = 75
      object chkHandicupEdad: TcxCheckBox
        Left = 42
        Top = 26
        OnFocusChanged = chkHandicupEdadFocusChanged
        Caption = 'Handicup por Edad'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnClick = chkHandicupEdadClick
        OnExit = chkHandicupEdadExit
        Width = 142
      end
      object chkHandicupMoto: TcxCheckBox
        Left = 216
        Top = 26
        Caption = 'Handicup por Moto'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnClick = chkHandicupEdadClick
        OnExit = chkHandicupEdadExit
        Width = 142
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 290
      Width = 527
      Height = 48
      Align = alTop
      Caption = ' Valore de Inscripci'#243'n '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      ExplicitTop = 273
      object cxLabel1: TcxLabel
        Left = 42
        Top = 21
        Caption = 'Organizador:'
        ParentFont = False
        Style.BorderColor = clMenuHighlight
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuText
        Style.IsFontAssigned = True
        Properties.ShadowedColor = clMenuHighlight
      end
      object cxLabel2: TcxLabel
        Left = 240
        Top = 21
        Caption = 'Cordillerano:'
        ParentFont = False
        Style.BorderColor = clMenuHighlight
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuText
        Style.IsFontAssigned = True
        Properties.ShadowedColor = clMenuHighlight
      end
      object txtOrganizador: TcxCurrencyEdit
        Left = 120
        Top = 20
        OnFocusChanged = txtOrganizadorFocusChanged
        ParentFont = False
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnExit = txtOrganizadorExit
        OnKeyUp = txtOrganizadorKeyUp
        Width = 104
      end
      object txtCordillerano: TcxCurrencyEdit
        Left = 316
        Top = 20
        OnFocusChanged = txtOrganizadorExit
        ParentFont = False
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnExit = txtOrganizadorExit
        OnKeyUp = txtOrganizadorKeyUp
        Width = 104
      end
    end
  end
  inherited validationPanel: TPanel
    Top = 418
    Width = 529
    ExplicitTop = 397
    ExplicitWidth = 529
    inherited errorListView: TcxListView
      Width = 529
      ExplicitWidth = 529
    end
  end
  inherited cxButtonImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 25821279
  end
  inherited BindingsList: TBindingsList
    Left = 360
    Top = 8
  end
  inherited BindScope: TBindScope
    Left = 408
    Top = 8
  end
  inherited cxInternalCRUDImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 25821407
  end
  inherited cxErrorImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 15204816
  end
  object ZTipoCategoria: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'oid'
    CachedUpdates = True
    TableName = 'tipo_categoria'
    IndexFieldNames = 'oid Asc'
    Left = 424
    Top = 72
  end
  object DSTipoCategoria: TDataSource
    DataSet = ZTipoCategoria
    Left = 424
    Top = 120
  end
end
