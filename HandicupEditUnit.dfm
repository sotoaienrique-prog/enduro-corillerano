inherited HandicupEditor: THandicupEditor
  Caption = 'Editor de Handicup'
  ClientHeight = 321
  Constraints.MinHeight = 300
  ExplicitWidth = 500
  ExplicitHeight = 359
  PixelsPerInch = 96
  TextHeight = 13
  inherited buttonPanel: TPanel
    Top = 284
    ExplicitTop = 284
  end
  inherited mainPanel: TPanel
    Height = 243
    ExplicitHeight = 243
    object rgTipo: TcxRadioGroup
      Left = 56
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Tipo de Handicup '
      Properties.Items = <>
      TabOrder = 0
      Height = 73
      Width = 385
    end
    object txtEdadBase: TcxCurrencyEdit
      Left = 116
      Top = 118
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
      OnExit = txtEdadBaseExit
      OnKeyUp = txtEdadBaseKeyUp
      Width = 91
    end
    object txtSegundos: TcxCurrencyEdit
      Left = 333
      Top = 118
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0;'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      OnExit = txtEdadBaseExit
      OnKeyUp = txtEdadBaseKeyUp
      Width = 91
    end
    object cmbTipoMoto: TDBLookupComboBox
      Left = 116
      Top = 194
      Width = 308
      Height = 24
      Anchors = [akTop, akRight]
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'oid'
      ListField = 'nombre'
      ListSource = DSTipoMoto
      ParentFont = False
      TabOrder = 3
      OnExit = cmbCategoriaExit
      OnKeyUp = cmbCategoriaKeyUp
    end
    object lblTipoMoto: TcxLabel
      Left = 46
      Top = 200
      Anchors = [akTop, akRight]
      Caption = 'Tipo Moto:'
      Enabled = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lblCategoria: TcxLabel
      Left = 51
      Top = 162
      Caption = 'Categor'#237'a:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cmbCategoria: TDBLookupComboBox
      Left = 116
      Top = 156
      Width = 308
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DropDownRows = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'oid'
      ListField = 'nombre'
      ListSource = DSCategoria
      NullValueKey = 46
      ParentFont = False
      TabOrder = 6
      OnExit = cmbCategoriaExit
      OnKeyUp = cmbCategoriaKeyUp
    end
  end
  inherited validationPanel: TPanel
    Top = 243
    ExplicitTop = 243
  end
  object rbCategoria: TcxRadioButton [3]
    Left = 80
    Top = 56
    Width = 113
    Height = 17
    Caption = 'Categor'#237'a'
    Checked = True
    TabOrder = 3
    TabStop = True
    OnClick = rbCategoriaClick
    OnExit = rbCategoriaExit
    OnMouseDown = rbCategoriaMouseDown
  end
  object rbModeloMoto: TcxRadioButton [4]
    Left = 224
    Top = 56
    Width = 113
    Height = 17
    Caption = 'Moto'
    TabOrder = 4
    OnClick = rbModeloMotoClick
    OnExit = rbCategoriaExit
    OnMouseDown = rbCategoriaMouseDown
  end
  object lblEdadBase: TcxLabel [5]
    Left = 46
    Top = 119
    Caption = 'Edad Base:'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object lblSegundos: TcxLabel [6]
    Left = 246
    Top = 119
    Caption = 'Seg. Por A'#241'o:'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  inherited cxButtonImageList: TcxImageList
    FormatVersion = 1
  end
  inherited BindingsList: TBindingsList
    Left = 320
    Top = 224
  end
  inherited BindScope: TBindScope
    Left = 384
    Top = 224
  end
  inherited cxInternalCRUDImageList: TcxImageList
    FormatVersion = 1
  end
  inherited cxErrorImageList: TcxImageList
    FormatVersion = 1
  end
  object ZCategoria: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'nombre'
    CachedUpdates = True
    TableName = 'categorias'
    IndexFieldNames = 'nombre Asc'
    Left = 424
    Top = 25
  end
  object DSCategoria: TDataSource
    DataSet = ZCategoria
    Left = 424
    Top = 73
  end
  object ZTipoMoto: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'nombre'
    CachedUpdates = True
    TableName = 'modelo_moto'
    IndexFieldNames = 'nombre Asc'
    Left = 360
    Top = 24
  end
  object DSTipoMoto: TDataSource
    DataSet = ZTipoMoto
    Left = 360
    Top = 72
  end
end
