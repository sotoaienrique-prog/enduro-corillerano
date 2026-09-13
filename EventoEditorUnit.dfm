inherited EventEditor: TEventEditor
  Caption = 'Editor de Eventos'
  ClientHeight = 547
  ClientWidth = 633
  Constraints.MinHeight = 400
  Constraints.MinWidth = 400
  ExplicitTop = -48
  ExplicitWidth = 649
  ExplicitHeight = 585
  PixelsPerInch = 96
  TextHeight = 13
  inherited buttonPanel: TPanel
    Top = 510
    Width = 633
    ExplicitTop = 510
    ExplicitWidth = 633
    inherited btnAccept: TAeroButton
      Left = 537
      Top = 6
      ExplicitLeft = 537
      ExplicitTop = 6
    end
    inherited btnCancel: TAeroButton
      Left = 431
      ExplicitLeft = 431
    end
  end
  inherited mainPanel: TPanel
    Width = 633
    Height = 469
    ExplicitWidth = 633
    ExplicitHeight = 469
    object gbDatosGenerales: TGroupBox
      Left = 1
      Top = 1
      Width = 631
      Height = 200
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
        631
        200)
      object lblNombre: TcxLabel
        Left = 28
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
        Left = 85
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
        OnKeyUp = textKeyUp
        Width = 537
      end
      object lblFecha: TcxLabel
        Left = 39
        Top = 56
        Caption = 'Fecha:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object dtpFecha: TAdvDateTimePicker
        Left = 85
        Top = 55
        Width = 209
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        Date = 41306.926064814810000000
        Time = 41306.926064814810000000
        DoubleBuffered = True
        Kind = dkDate
        ParentDoubleBuffered = False
        TabOrder = 1
        OnExit = dtpFechaExit
        OnKeyUp = dtpFechaKeyUp
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 41306.926064814810000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
      end
      object cxLabel2: TcxLabel
        Left = 3
        Top = 113
        Caption = 'Campeonato:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbCampeonato: TDBLookupComboBox
        Left = 85
        Top = 113
        Width = 209
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'nombre'
        ListSource = DSCampeonato
        ParentFont = False
        TabOrder = 4
        OnExit = cmbComboExit
        OnKeyUp = cmbComboKeyUp
      end
      object cxLabel1: TcxLabel
        Left = 322
        Top = 113
        Anchors = [akTop, akRight]
        Caption = 'Nro. Fecha:'
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
      object txtNroFecha: TcxCurrencyEdit
        Left = 395
        Top = 112
        Anchors = [akTop, akRight]
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 5
        OnKeyUp = textKeyUp
        Width = 134
      end
      object lblProvincia: TcxLabel
        Left = 24
        Top = 83
        Caption = 'Provincia:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbProvincia: TDBLookupComboBox
        Left = 85
        Top = 83
        Width = 209
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
        TabOrder = 2
      end
      object lblLocalidad: TcxLabel
        Left = 332
        Top = 83
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
        Left = 395
        Top = 82
        Width = 227
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
        TabOrder = 3
        OnExit = cmbLocalidadExit
      end
      object cmbTipoDeCompetencia: TDBLookupComboBox
        Left = 395
        Top = 141
        Width = 227
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'nombre'
        ListSource = DSTipoDeCompetencia
        ParentFont = False
        TabOrder = 12
        OnExit = cmbComboExit
        OnKeyUp = cmbComboKeyUp
      end
      object cxLabel3: TcxLabel
        Left = 264
        Top = 144
        Caption = 'Tipo de Competencia:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lblNroVueltas: TcxLabel
        Left = 4
        Top = 144
        Caption = 'Nro. Vueltas:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtNroVuelta: TcxCurrencyEdit
        Left = 85
        Top = 143
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 15
        OnKeyUp = textKeyUp
        Width = 65
      end
      object chkUltimaFecha: TcxCheckBox
        Left = 81
        Top = 172
        OnFocusChanged = chkUltimaFechaFocusChanged
        Caption = #218'ltima Fecha'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 16
        OnClick = chkUltimaFechaClick
        OnExit = chkUltimaFechaExit
        Width = 142
      end
      object chkUsaPuntosExtra: TcxCheckBox
        Left = 241
        Top = 172
        OnFocusChanged = chkUltimaFechaFocusChanged
        Caption = 'Utiliza Puntos Extra'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 17
        OnClick = chkUltimaFechaClick
        OnExit = chkUltimaFechaExit
        Width = 142
      end
      object chkUtilizaHandicup: TcxCheckBox
        Left = 395
        Top = 172
        OnFocusChanged = chkUltimaFechaFocusChanged
        Caption = 'Utiliza Handicup'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 18
        OnClick = chkUltimaFechaClick
        OnExit = chkUltimaFechaExit
        Width = 142
      end
    end
    object gbPista: TGroupBox
      Left = 1
      Top = 201
      Width = 631
      Height = 267
      Align = alClient
      Caption = ' Datos de la Pista '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object panelRecorrido: TPanel
        Left = 2
        Top = 113
        Width = 627
        Height = 15
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object txtDistancia: TcxCurrencyEdit
          Left = 227
          Top = 69
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
          Visible = False
          OnKeyUp = textKeyUp
          Width = 134
        end
        object lblMetros: TcxLabel
          Left = 367
          Top = 70
          Caption = 'metros'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Visible = False
        end
        object lblNumMoto: TcxLabel
          Left = 91
          Top = 70
          Caption = 'Distancia del Recorrido:'
          ParentFont = False
          Style.BorderColor = clMenuHighlight
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clMenuHighlight
          Style.IsFontAssigned = True
          Properties.ShadowedColor = clMenuHighlight
          Visible = False
        end
      end
      object GBVueltasCategoria: TcxGroupBox
        Left = 2
        Top = 113
        Align = alClient
        Caption = ' Vueltas Por Categor'#237'a '
        TabOrder = 1
        Height = 152
        Width = 627
        object gridNumPorCategoria: TcxGrid
          Left = 2
          Top = 89
          Width = 623
          Height = 20
          Align = alClient
          TabOrder = 0
          object gridNumPorCategoriaDBTableView1: TcxGridDBTableView
            DataController.DataSource = numerosICRUDDS
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.FocusRect = False
            OptionsView.NoDataToDisplayInfoText = 'Sin informaci'#243'n para mostrar'
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object gridNumPorCategoriaDBTableView1Column2: TcxGridDBColumn
              Caption = 'Categor'#237'a'
              DataBinding.FieldName = 'numerosICRUDCategoria'
              Options.Editing = False
              Width = 451
            end
            object gridNumPorCategoriaDBTableView1Column1: TcxGridDBColumn
              Caption = 'N'#250'mero de Vueltas'
              DataBinding.FieldName = 'numerosICRUDNumero'
              Width = 170
            end
          end
          object gridNumPorCategoriaLevel1: TcxGridLevel
            GridView = gridNumPorCategoriaDBTableView1
          end
        end
        object panelDatosCategoria: TPanel
          Left = 2
          Top = 19
          Width = 623
          Height = 70
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            623
            70)
          object lblCateogoria: TcxLabel
            Left = 50
            Top = 2
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
            Left = 115
            Top = 1
            Width = 270
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
            ParentFont = False
            TabOrder = 1
            OnExit = cmbComboExit
            OnKeyUp = cmbComboKeyUp
          end
          object lblNroVueltasPorCat: TcxLabel
            Left = 25
            Top = 31
            Caption = 'N'#186' de Vueltas:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object txtNroVueltasPorCat: TcxCurrencyEdit
            Left = 115
            Top = 31
            ParentFont = False
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '0;'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            OnKeyUp = textKeyUp
            Width = 86
          end
        end
        object panelInternalErrorList: TPanel
          Left = 2
          Top = 109
          Width = 623
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          object internalErrorListView: TcxListView
            Left = 0
            Top = 0
            Width = 623
            Height = 41
            TabStop = False
            Align = alClient
            Columns = <
              item
                Caption = 'message'
                Width = 480
              end>
            HoverTime = 0
            ShowColumnHeaders = False
            StateImages = cxErrorImageList
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object btnAgregar: TAeroButton
          Left = 513
          Top = 10
          Width = 111
          Height = 36
          ImageIndex = 0
          Images = cxInternalCRUDImageList
          Version = '1.0.0.1'
          Caption = ' Agregar'
          TabOrder = 3
          OnClick = btnAgregarClick
        end
        object btnEliminar: TAeroButton
          Left = 513
          Top = 46
          Width = 111
          Height = 37
          ImageIndex = 1
          Images = cxInternalCRUDImageList
          Version = '1.0.0.1'
          Caption = ' Eliminar'
          TabOrder = 4
          OnClick = btnEliminarClick
        end
      end
      object panelNombreCheckpoints: TcxGroupBox
        Left = 2
        Top = 16
        Align = alTop
        Caption = ' Nombre Checkpoints '
        TabOrder = 2
        Height = 97
        Width = 627
      end
    end
  end
  inherited validationPanel: TPanel
    Top = 469
    Width = 633
    ExplicitTop = 469
    ExplicitWidth = 633
    inherited errorListView: TcxListView
      Width = 633
      ExplicitWidth = 633
    end
  end
  inherited cxButtonImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 28442735
  end
  inherited BindingsList: TBindingsList
    Left = 112
    Top = 384
  end
  inherited BindScope: TBindScope
    Left = 176
    Top = 384
  end
  inherited cxInternalCRUDImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 28442799
  end
  inherited cxErrorImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 28311792
  end
  object ZTProvincia: TZTable
    Connection = ConnectionModule.ZConnection
    CachedUpdates = True
    TableName = 'provincias'
    Left = 432
    Top = 384
  end
  object ZTLocalidad: TZTable
    Connection = ConnectionModule.ZConnection
    CachedUpdates = True
    TableName = 'localidad'
    MasterFields = 'oid'
    MasterSource = DSProvincia
    LinkedFields = 'provincia_oid'
    Left = 504
    Top = 384
  end
  object DSProvincia: TDataSource
    DataSet = ZTProvincia
    Left = 432
    Top = 432
  end
  object DSLocalidad: TDataSource
    DataSet = ZTLocalidad
    Left = 504
    Top = 432
  end
  object ZCampeonato: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'nombre'
    CachedUpdates = True
    TableName = 'campeonato'
    IndexFieldNames = 'nombre Asc'
    Left = 352
    Top = 384
  end
  object DSCampeonato: TDataSource
    DataSet = ZCampeonato
    Left = 352
    Top = 432
  end
  object ZTTipoDeCompetencia: TZTable
    Connection = ConnectionModule.ZConnection
    CachedUpdates = True
    TableName = 'tipo_evento'
    Left = 592
    Top = 384
  end
  object DSTipoDeCompetencia: TDataSource
    DataSet = ZTTipoDeCompetencia
    Left = 592
    Top = 432
  end
  object BindScopeNumCat: TBindScope
    Left = 48
    Top = 384
  end
  object numerosICRUDData: TJvMemoryData
    FieldDefs = <
      item
        Name = 'numerosICRUDCategoriaOID'
        DataType = ftInteger
      end
      item
        Name = 'numerosICRUDNumero'
        DataType = ftInteger
      end
      item
        Name = 'numerosICRUDCategoria'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'oid'
        DataType = ftInteger
      end>
    Left = 48
    Top = 328
  end
  object numerosICRUDDS: TDataSource
    DataSet = numerosICRUDData
    Left = 112
    Top = 328
  end
  object DSCategoria: TDataSource
    DataSet = ZCategoria
    Left = 456
    Top = 249
  end
  object ZCategoria: TZTable
    Connection = ConnectionModule.ZConnection
    TableName = 'categorias'
    Left = 456
    Top = 200
  end
end
