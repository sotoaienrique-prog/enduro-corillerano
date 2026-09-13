object GrillaReconocimientoMultiForm: TGrillaReconocimientoMultiForm
  Left = 0
  Top = 0
  Caption = 'Grilla de Reconocimiento'
  ClientHeight = 518
  ClientWidth = 1234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter: TJvNetscapeSplitter
    Left = 0
    Top = 89
    Width = 1234
    Height = 10
    Cursor = crVSplit
    Align = alTop
    MinSize = 1
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitLeft = 1
    ExplicitTop = 63
    ExplicitWidth = 748
  end
  object topPanel: TPanel
    Left = 0
    Top = 0
    Width = 1234
    Height = 89
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1234
      89)
    object btnStart: TAeroButton
      AlignWithMargins = True
      Left = 1099
      Top = 2
      Width = 123
      Height = 35
      ImageIndex = 0
      Images = cxImageList
      Spacing = 10
      Version = '1.0.0.1'
      Anchors = [akTop, akRight]
      Caption = 'Comenzar'
      TabOrder = 3
      OnClick = btnStartClick
    end
    object btnStop: TAeroButton
      AlignWithMargins = True
      Left = 1099
      Top = 43
      Width = 123
      Height = 35
      ImageIndex = 1
      Images = cxImageList
      Spacing = 10
      Version = '1.0.0.1'
      Anchors = [akTop, akRight]
      Caption = 'Detener'
      Enabled = False
      TabOrder = 4
      OnClick = btnStopClick
    end
    object lblFilterEvento: TcxLabel
      Left = 43
      Top = 36
      Caption = 'Evento:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clMenuText
      Style.IsFontAssigned = True
    end
    object cmbEvento: TDBLookupComboBox
      Left = 96
      Top = 32
      Width = 369
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'oid'
      ListField = 'nombre'
      ListSource = DSEvento
      ParentFont = False
      TabOrder = 1
    end
    object cxLabel1: TcxLabel
      Left = 481
      Top = 4
      Caption = 'Toma Tiempo:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cmbTomaTiempoEvento: TDBLookupComboBox
      Left = 571
      Top = 4
      Width = 513
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      DropDownRows = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'oid'
      ListField = 'nombre'
      ListSource = DSTomaTiempoEvento
      ParentFont = False
      TabOrder = 2
      OnCloseUp = cmbTomaTiempoEventoCloseUp
    end
    object lblCampeonato: TcxLabel
      Left = 13
      Top = 8
      Caption = 'Campeonato:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clInfoText
      Style.IsFontAssigned = True
    end
    object cmbCampeonato: TDBLookupComboBox
      Left = 96
      Top = 4
      Width = 369
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'oid'
      ListField = 'nombre'
      ListSource = DSCampeonato
      ParentFont = False
      TabOrder = 0
    end
    object lblMostrarPilotos: TcxLabel
      Left = 42
      Top = 60
      Caption = 'Mostrar:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object txtNumPilotos: TcxCurrencyEdit
      Left = 96
      Top = 60
      EditValue = 30.000000000000000000
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0;'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 9
      Width = 46
    end
    object lblPilotos: TcxLabel
      Left = 148
      Top = 60
      Caption = 'Pilotos'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object chkMostrarNyA: TcxCheckBox
      Left = 202
      Top = 59
      Caption = 'Apellido'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 11
      Width = 142
    end
    object cxLabel2: TcxLabel
      Left = 501
      Top = 36
      Caption = 'Categor'#237'as:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object CategoriaCheckListBox: TJvCheckListBox
      Left = 571
      Top = 32
      Width = 512
      Height = 51
      Anchors = [akLeft, akTop, akRight, akBottom]
      DoubleBuffered = False
      ItemHeight = 13
      ParentDoubleBuffered = False
      TabOrder = 13
    end
  end
  object bottomPanel: TPanel
    Left = 0
    Top = 492
    Width = 1234
    Height = 26
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      1234
      26)
    object lblTiempoCaption: TLabel
      Left = 1016
      Top = 5
      Width = 156
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Tiempo para Actualizaci'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitLeft = 737
    end
    object lblTiempoValue: TLabel
      Left = 1178
      Top = 5
      Width = 4
      Height = 16
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ExplicitLeft = 899
    end
  end
  object gridPanel: TPanel
    Left = 0
    Top = 99
    Width = 1234
    Height = 393
    Align = alClient
    TabOrder = 2
    object cxGridPosiciones1: TcxGrid
      Left = 1
      Top = 1
      Width = 168
      Height = 391
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      ExplicitLeft = -5
      ExplicitTop = -4
      object cxGridPosiciones1DBTableView: TcxGridDBTableView
        DataController.DataSource = DSPosiciones1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<No hay datos para mostrar>'
        OptionsView.GroupByBox = False
        Styles.Content = cxStyle1
        Styles.Header = cxStyle2
        object cxGridPosiciones1DBTableViewColumn1: TcxGridDBColumn
          Caption = 'Pos'
          DataBinding.FieldName = 'posicion'
          Width = 20
        end
        object cxGridPosiciones1DBTableViewnro_moto: TcxGridDBColumn
          Caption = 'Nro'
          DataBinding.FieldName = 'nro_moto'
          Options.Sorting = False
          Width = 32
        end
        object cxGridPosiciones1DBTableViewcategoria: TcxGridDBColumn
          DataBinding.FieldName = 'categoria'
          Visible = False
          GroupIndex = 0
          Options.Sorting = False
          Width = 280
          IsCaptionAssigned = True
        end
        object cxGridPosiciones1DBTableViewColumn2: TcxGridDBColumn
          Caption = 'Nombre'
          DataBinding.FieldName = 'nombre_piloto'
        end
        object cxGridPosiciones1DBTableViewColumn3: TcxGridDBColumn
          Caption = 'Corriendo'
          DataBinding.FieldName = 'corriendo'
        end
        object cxGridPosiciones1DBTableViewnombre_piloto: TcxGridDBColumn
          Caption = 'Tiempo Total'
          DataBinding.FieldName = 'formated_tiempo_sec'
          Options.Sorting = False
          Width = 97
        end
      end
      object cxGridPosiciones1Level: TcxGridLevel
        GridView = cxGridPosiciones1DBTableView
      end
    end
    object cxGridPosiciones2: TcxGrid
      Left = 169
      Top = 1
      Width = 168
      Height = 391
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      object cxGridPosiciones2DBTableView: TcxGridDBTableView
        DataController.DataSource = DSPosiciones2
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<No hay datos para mostrar>'
        OptionsView.GroupByBox = False
        Styles.Content = cxStyle1
        Styles.Header = cxStyle2
        object cxGridPosiciones2DBTableViewColumn1: TcxGridDBColumn
          Caption = 'Pos'
          DataBinding.FieldName = 'posicion'
          Width = 20
        end
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = 'Nro'
          DataBinding.FieldName = 'nro_moto'
          Options.Sorting = False
          Width = 32
        end
        object cxGridDBColumn2: TcxGridDBColumn
          DataBinding.FieldName = 'categoria'
          Visible = False
          GroupIndex = 0
          Options.Sorting = False
          Width = 280
          IsCaptionAssigned = True
        end
        object cxGridPosiciones2DBTableViewColumn2: TcxGridDBColumn
          Caption = 'Nombre'
          DataBinding.FieldName = 'nombre_piloto'
        end
        object cxGridPosiciones2DBTableViewColumn3: TcxGridDBColumn
          Caption = 'Corriendo'
          DataBinding.FieldName = 'corriendo'
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = 'Tiempo Total'
          DataBinding.FieldName = 'formated_tiempo_sec'
          Options.Sorting = False
          Width = 99
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridPosiciones2DBTableView
      end
    end
    object cxGridPosiciones3: TcxGrid
      Left = 337
      Top = 1
      Width = 168
      Height = 391
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      object cxGridPosiciones3DBTableView: TcxGridDBTableView
        DataController.DataSource = DSPosiciones3
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<No hay datos para mostrar>'
        OptionsView.GroupByBox = False
        Styles.Content = cxStyle1
        Styles.Header = cxStyle2
        object cxGridPosiciones3DBTableViewColumn1: TcxGridDBColumn
          Caption = 'Pos'
          DataBinding.FieldName = 'posicion'
          Width = 20
        end
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = 'Nro'
          DataBinding.FieldName = 'nro_moto'
          Options.Sorting = False
          Width = 32
        end
        object cxGridDBColumn5: TcxGridDBColumn
          DataBinding.FieldName = 'categoria'
          Visible = False
          GroupIndex = 0
          Options.Sorting = False
          Width = 280
          IsCaptionAssigned = True
        end
        object cxGridPosiciones3DBTableViewColumn2: TcxGridDBColumn
          Caption = 'Nombre'
          DataBinding.FieldName = 'nombre_piloto'
        end
        object cxGridPosiciones3DBTableViewColumn3: TcxGridDBColumn
          Caption = 'Corriendo'
          DataBinding.FieldName = 'corriendo'
        end
        object cxGridDBColumn6: TcxGridDBColumn
          Caption = 'Tiempo Total'
          DataBinding.FieldName = 'formated_tiempo_sec'
          Options.Sorting = False
          Width = 114
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridPosiciones3DBTableView
      end
    end
    object cxGridPosiciones4: TcxGrid
      Left = 505
      Top = 1
      Width = 168
      Height = 391
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      object cxGridPosiciones4DBTableView: TcxGridDBTableView
        DataController.DataSource = DSPosiciones4
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<No hay datos para mostrar>'
        OptionsView.GroupByBox = False
        Styles.Content = cxStyle1
        Styles.Header = cxStyle2
        object cxGridDBColumn7: TcxGridDBColumn
          Caption = 'Pos'
          DataBinding.FieldName = 'posicion'
          Width = 20
        end
        object cxGridDBColumn8: TcxGridDBColumn
          Caption = 'Nro'
          DataBinding.FieldName = 'nro_moto'
          Options.Sorting = False
          Width = 32
        end
        object cxGridDBColumn9: TcxGridDBColumn
          DataBinding.FieldName = 'categoria'
          Visible = False
          GroupIndex = 0
          Options.Sorting = False
          Width = 280
          IsCaptionAssigned = True
        end
        object cxGridPosiciones4DBTableViewColumn1: TcxGridDBColumn
          Caption = 'Nombre'
          DataBinding.FieldName = 'nombre_piloto'
        end
        object cxGridPosiciones4DBTableViewColumn2: TcxGridDBColumn
          Caption = 'Corriendo'
          DataBinding.FieldName = 'corriendo'
        end
        object cxGridDBColumn10: TcxGridDBColumn
          Caption = 'Tiempo Total'
          DataBinding.FieldName = 'formated_tiempo_sec'
          Options.Sorting = False
          Width = 114
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = cxGridPosiciones4DBTableView
      end
    end
    object cxGridPosiciones5: TcxGrid
      Left = 673
      Top = 1
      Width = 168
      Height = 391
      Align = alLeft
      TabOrder = 4
      Visible = False
      object cxGridPosiciones5DBTableView: TcxGridDBTableView
        DataController.DataSource = DSPosiciones5
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<No hay datos para mostrar>'
        OptionsView.GroupByBox = False
        Styles.Content = cxStyle1
        Styles.Header = cxStyle2
        object cxGridDBColumn11: TcxGridDBColumn
          Caption = 'Pos'
          DataBinding.FieldName = 'posicion'
          Width = 20
        end
        object cxGridDBColumn12: TcxGridDBColumn
          Caption = 'Nro'
          DataBinding.FieldName = 'nro_moto'
          Options.Sorting = False
          Width = 32
        end
        object cxGridDBColumn13: TcxGridDBColumn
          DataBinding.FieldName = 'categoria'
          Visible = False
          GroupIndex = 0
          Options.Sorting = False
          Width = 280
          IsCaptionAssigned = True
        end
        object cxGridPosiciones5DBTableViewColumn1: TcxGridDBColumn
          Caption = 'Nombre'
          DataBinding.FieldName = 'nombre_piloto'
        end
        object cxGridPosiciones5DBTableViewColumn2: TcxGridDBColumn
          Caption = 'Corriendo'
          DataBinding.FieldName = 'corriendo'
        end
        object cxGridDBColumn14: TcxGridDBColumn
          Caption = 'Tiempo Total'
          DataBinding.FieldName = 'formated_tiempo_sec'
          Options.Sorting = False
          Width = 114
        end
      end
      object cxGridLevel4: TcxGridLevel
        GridView = cxGridPosiciones5DBTableView
      end
    end
    object cxGridPosiciones6: TcxGrid
      Left = 841
      Top = 1
      Width = 168
      Height = 391
      Align = alLeft
      TabOrder = 5
      Visible = False
      object cxGridPosiciones6DBTableView: TcxGridDBTableView
        DataController.DataSource = DSPosiciones6
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<No hay datos para mostrar>'
        OptionsView.GroupByBox = False
        Styles.Content = cxStyle1
        Styles.Header = cxStyle2
        object cxGridDBColumn15: TcxGridDBColumn
          Caption = 'Pos'
          DataBinding.FieldName = 'posicion'
          Width = 20
        end
        object cxGridDBColumn16: TcxGridDBColumn
          Caption = 'Nro'
          DataBinding.FieldName = 'nro_moto'
          Options.Sorting = False
          Width = 32
        end
        object cxGridDBColumn17: TcxGridDBColumn
          DataBinding.FieldName = 'categoria'
          Visible = False
          GroupIndex = 0
          Options.Sorting = False
          Width = 280
          IsCaptionAssigned = True
        end
        object cxGridPosiciones6DBTableViewColumn1: TcxGridDBColumn
          Caption = 'Nombre'
          DataBinding.FieldName = 'nombre_piloto'
        end
        object cxGridPosiciones6DBTableViewColumn2: TcxGridDBColumn
          Caption = 'Corriendo'
          DataBinding.FieldName = 'corriendo'
        end
        object cxGridDBColumn18: TcxGridDBColumn
          Caption = 'Tiempo Total'
          DataBinding.FieldName = 'formated_tiempo_sec'
          Options.Sorting = False
          Width = 114
        end
      end
      object cxGridLevel5: TcxGridLevel
        GridView = cxGridPosiciones6DBTableView
      end
    end
    object cxGridPosiciones7: TcxGrid
      Left = 1009
      Top = 1
      Width = 168
      Height = 391
      Align = alLeft
      TabOrder = 6
      Visible = False
      object cxGridPosiciones7DBTableView: TcxGridDBTableView
        DataController.DataSource = DSPosiciones7
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<No hay datos para mostrar>'
        OptionsView.GroupByBox = False
        Styles.Content = cxStyle1
        Styles.Header = cxStyle2
        object cxGridDBColumn19: TcxGridDBColumn
          Caption = 'Pos'
          DataBinding.FieldName = 'posicion'
          Width = 20
        end
        object cxGridDBColumn20: TcxGridDBColumn
          Caption = 'Nro'
          DataBinding.FieldName = 'nro_moto'
          Options.Sorting = False
          Width = 32
        end
        object cxGridDBColumn21: TcxGridDBColumn
          DataBinding.FieldName = 'categoria'
          Visible = False
          GroupIndex = 0
          Options.Sorting = False
          Width = 280
          IsCaptionAssigned = True
        end
        object cxGridPosiciones7DBTableViewColumn1: TcxGridDBColumn
          Caption = 'Nombre'
          DataBinding.FieldName = 'nombre_piloto'
        end
        object cxGridPosiciones7DBTableViewColumn2: TcxGridDBColumn
          Caption = 'Corriendo'
          DataBinding.FieldName = 'corriendo'
        end
        object cxGridDBColumn22: TcxGridDBColumn
          Caption = 'Tiempo Total'
          DataBinding.FieldName = 'formated_tiempo_sec'
          Options.Sorting = False
          Width = 114
        end
      end
      object cxGridLevel6: TcxGridLevel
        GridView = cxGridPosiciones7DBTableView
      end
    end
  end
  object ZCampeonato: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'anio'
    SortType = stDescending
    CachedUpdates = True
    TableName = 'campeonato'
    IndexFieldNames = 'anio Desc'
    Left = 88
    Top = 160
  end
  object DSCampeonato: TDataSource
    DataSet = ZCampeonato
    Left = 88
    Top = 216
  end
  object DSEvento: TDataSource
    DataSet = ZEvento
    Left = 152
    Top = 216
  end
  object ZEvento: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select e.oid, CONCAT(e.nro_fecha, '#39' - '#39', DATE_FORMAT(e.fecha,  '#39 +
        '%d/%m/%Y'#39'), '#39' - '#39', e.nombre) as nombre, e.campeonato_oid '
      'from evento e'
      'order by e.nro_fecha desc')
    Params = <>
    MasterFields = 'oid'
    MasterSource = DSCampeonato
    LinkedFields = 'campeonato_oid'
    Left = 152
    Top = 160
  end
  object ZTomaTiempoEvento: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select oid, CONCAT(date_format(toma_tiempo_start_time, '#39'%d/%m/%Y' +
        ' %H:%i:%s'#39'), '#39' - '#39', nombre) as nombre, evento_oid'
      'from toma_tiempo_evento'
      'where tipo_toma_tiempo = '#39'RECONOCIMIENTO'#39
      'order by oid desc')
    Params = <>
    MasterFields = 'oid'
    MasterSource = DSEvento
    LinkedFields = 'evento_oid'
    Left = 216
    Top = 160
  end
  object DSTomaTiempoEvento: TDataSource
    DataSet = ZTomaTiempoEvento
    Left = 216
    Top = 216
  end
  object QueryCategorias: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      ' select distinct cat.oid, cat.nombre '
      ' from inscripcion_piloto_evento ipe '
      '  join piloto p on ipe.piloto_oid = p.oid, categorias cat '
      
        ' where sel_categoria_oid_by_evento_and_tipo_categoria((select mi' +
        'n(ipe.tipo_categoria_oid) '
      '                          from inscripcion_piloto_evento ipe '
      '                          where ipe.evento_oid = ipe.evento_oid '
      
        '                          and ipe.piloto_oid = p.oid), ipe.event' +
        'o_oid, p.oid) = cat.oid '
      ' and ipe.evento_oid = :evento_oid'
      'order by  cat.orden is null, cat.orden asc;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
  end
  object DSCategorias: TDataSource
    DataSet = QueryCategorias
    Left = 272
    Top = 216
  end
  object cxImageList: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 9962176
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000050101
          0122060606460D0D0D5F0E0E0E600707074B0101012800000008000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000011191919766A6A6ACCAFAF
          AFF2C9C9C9FFC7C7C7FFC1C1C1FFBBBBBBFF9F9F9FF5656565D41E1E1E840000
          001A000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000909094E7E7E7ED6E8E8E8FFCACACAFF8B8B
          8BFF595959FF414141FF3E3E3EFF4C4C4CFF727272FFA0A0A0FFB9B9B9FF7B7B
          7BE60E0E0E610000000100000000000000000000000000000000000000000000
          000000000000000000001C1C1C7AE8E8E8FFE3E3E3FF5B5B5BFF212121FF1717
          17FF181818FF181818FF151515FF111111FF0B0B0BFF0F0F0FFF383838FFA4A4
          A4FFBABABAFF2828289800000006000000000000000000000000000000000000
          0000000000001D1D1D77ECECECFFBEBEBEFF333333FF202020FF282828FF2525
          25FF232323FF212121FF1E1E1EFF1C1C1CFF191919FF161616FF0C0C0CFF0F0F
          0FFF7E7E7EFFC1C1C1FF25252590000000000000000000000000000000000000
          000006060642DFDFDFFCC0C0C0FF292929FF2C2C2CFF2E2E2EFF2B2B2BFF2929
          29FF1E1E1EFF222222FF212121FF1E1E1EFF1C1C1CFF191919FF171717FF1111
          11FF070707FF7D7D7DFFB8B8B8FF0D0D0D620000000000000000000000000000
          000D7A7A7ACBDEDEDEFF404040FF313131FF333333FF303030FF242424FF8181
          81FF888888FF212121FF1E1E1EFF212121FF1E1E1EFF1B1B1BFF191919FF1616
          16FF111111FF0F0F0FFF9B9B9BFF7E7E7EE60101012100000000000000001313
          1361F1F1F1FF787878FF313131FF383838FF363636FF333333FF252525FF8F8F
          8FFFEDEDEDFFA8A8A8FF343434FF191919FF212121FF1E1E1EFF1B1B1BFF1919
          19FF171717FF0A0A0AFF404040FFC1C1C1FF1B1B1B7D00000000000000016666
          66BADFDFDFFF4B4B4BFF3B3B3BFF3B3B3BFF383838FF363636FF292929FF8C8C
          8CFFDBDBDBFFDEDEDEFFC7C7C7FF5B5B5BFF191919FF1F1F1FFF1E1E1EFF1C1C
          1CFF191919FF161616FF101010FFA0A0A0FF5B5B5BC60000000700000015B0B0
          B0E4B2B2B2FF3F3F3FFF3F3F3FFF3D3D3DFF3B3B3BFF383838FF2B2B2BFF8D8D
          8DFFD7D7D7FFCECECEFFD6D6D6FFDEDEDEFF878787FF1F1F1FFF1A1A1AFF1F1F
          1FFF1C1C1CFF191919FF0B0B0BFF6A6A6AFF9E9E9EF60101012B04040430CECE
          CEF9AEAEAEFF5F5F5FFF3C3C3CFF404040FF3D3D3DFF3B3B3BFF2D2D2DFF9292
          92FFE0E0E0FFCFCFCFFFCDCDCDFFD0D0D0FFDCDCDCFFB4B4B4FF434343FF1616
          16FF1F1F1FFF1B1B1BFF111111FF454545FFB8B8B8FF0909095208080842D6D6
          D6FFB4B4B4FFA1A1A1FF595959FF3C3C3CFF404040FF3E3E3EFF303030FF9696
          96FFECECECFFDADADAFFD3D3D3FFCECECEFFCDCDCDFFD8D8D8FFD4D4D4FF6262
          62FF1B1B1BFF1E1E1EFF161616FF383838FFBFBFBFFF0F0F0F6408080841D2D2
          D2FFB8B8B8FFB1B1B1FFA4A4A4FF666666FF3E3E3EFF3D3D3DFF323232FF9B9B
          9BFFF8F8F8FFE6E6E6FFE0E0E0FFD9D9D9FFD3D3D3FFD9D9D9FFC6C6C6FF5858
          58FF1F1F1FFF202020FF181818FF3B3B3BFFC5C5C5FF0F0F0F630303032DC4C4
          C4F8BABABAFFB8B8B8FFAEAEAEFFAAAAAAFF818181FF4F4F4FFF303030FF9C9C
          9CFFFFFFFFFFF2F2F2FFEBEBEBFFE8E8E8FFE8E8E8FFA8A8A8FF3B3B3BFF1E1E
          1EFF242424FF232323FF1E1E1EFF545454FFC5C5C5FF0808084E00000013A4A4
          A4E0BFBFBFFFBDBDBDFFB4B4B4FFAFAFAFFFACACACFFA0A0A0FF757575FFB0B0
          B0FFFFFFFFFFFDFDFDFFFEFEFEFFECECECFF7C7C7CFF242424FF292929FF3131
          31FF393939FF3F3F3FFF2F2F2FFF878787FFADADADF201010126000000005E5E
          5EB2D3D3D3FFC6C6C6FFBEBEBEFFB6B6B6FFB0B0B0FFAAAAAAFFA1A1A1FFD1D1
          D1FFFFFFFFFFFFFFFFFFE9E9E9FF868686FF525252FF5B5B5BFF5E5E5EFF5D5D
          5DFF585858FF4E4E4EFF3E3E3EFFCACACAFF616161BF00000004000000001010
          1055D9D9D9FFBBBBBBFFCFCFCFFFBDBDBDFFB8B8B8FFB2B2B2FFA5A5A5FFD3D3
          D3FFFFFFFFFFD3D3D3FF8F8F8FFF848484FF848484FF7B7B7BFF727272FF6969
          69FF606060FF4F4F4FFF777777FFEFEFEFFF1919197300000000000000000000
          0008696969BDCBCBCBFFC4C4C4FFCCCCCCFFBFBFBFFFB9B9B9FFAFAFAFFFCBCB
          CBFFC8C8C8FF999999FF969696FF919191FF898989FF828282FF7A7A7AFF7272
          72FF696969FF585858FFD6D6D6FF898989DB0000001800000000000000000000
          000004040433C5C5C5F6BEBEBEFFCECECEFFCECECEFFC0C0C0FFBBBBBBFFB3B3
          B3FFAAAAAAFFA7A7A7FFA0A0A0FF999999FF929292FF8B8B8BFF838383FF7B7B
          7BFF676767FFBEBEBEFFDFDFDFFF090909510000000000000000000000000000
          00000000000016161663D1D1D1FDBFBFBFFFC4C4C4FFD4D4D4FFC5C5C5FFBBBB
          BBFFB6B6B6FFAFAFAFFFA9A9A9FFA2A2A2FF9B9B9BFF949494FF8B8B8BFF7D7D
          7DFFC4C4C4FFF0F0F0FF2020207C000000000000000000000000000000000000
          0000000000000000000015151561CBCBCBFACCCCCCFFBBBBBBFFCCCCCCFFCACA
          CAFFC2C2C2FFBCBCBCFFB5B5B5FFACACACFFA3A3A3FF9B9B9BFF9F9F9FFFE1E1
          E1FFE2E2E2FF2020207E00000000000000000000000000000000000000000000
          000000000000000000000000000006060639686868BFD7D7D7FFD1D1D1FFC6C6
          C6FFBABABAFFBDBDBDFFBBBBBBFFB4B4B4FFC3C3C3FFDFDFDFFFE8E8E8FF8080
          80D2090909490000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000711111159606060B6A6A6
          A6E4C6C6C6F9D2D2D2FFD4D4D4FFCFCFCFFBB1B1B1E86C6C6CC0161616670000
          000C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          00140404042F0808084509090946040404330000001800000002000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000050101
          0122060606460D0D0D5F0E0E0E600707074B0101012800000008000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000011191919766A6A6ACCAFAF
          AFF2C9C9C9FFC7C7C7FFC1C1C1FFBBBBBBFF9F9F9FF5656565D41E1E1E840000
          001A000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000909094E7E7E7ED6E8E8E8FFCACACAFF8B8B
          8BFF595959FF414141FF3E3E3EFF4C4C4CFF727272FFA0A0A0FFB9B9B9FF7B7B
          7BE60E0E0E610000000100000000000000000000000000000000000000000000
          000000000000000000001C1C1C7AE8E8E8FFE3E3E3FF5B5B5BFF212121FF1717
          17FF181818FF181818FF151515FF111111FF0B0B0BFF0F0F0FFF383838FFA4A4
          A4FFBABABAFF2828289800000006000000000000000000000000000000000000
          0000000000001D1D1D77ECECECFFBEBEBEFF333333FF202020FF282828FF2626
          26FF232323FF212121FF1E1E1EFF1C1C1CFF191919FF161616FF0C0C0CFF0F0F
          0FFF7E7E7EFFC1C1C1FF25252590000000000000000000000000000000000000
          000006060642DFDFDFFCC0C0C0FF292929FF2C2C2CFF2E2E2EFF2B2B2BFF2929
          29FF262626FF232323FF212121FF1E1E1EFF1C1C1CFF191919FF171717FF1111
          11FF070707FF7D7D7DFFB8B8B8FF0D0D0D620000000000000000000000000000
          000D7A7A7ACBDEDEDEFF404040FF313131FF343434FF2E2E2EFF242424FF2121
          21FF1E1E1EFF1B1B1BFF181818FF151515FF131313FF0F0F0FFF141414FF1717
          17FF111111FF0F0F0FFF9B9B9BFF7E7E7EE60101012100000000000000001313
          1361F1F1F1FF787878FF313131FF383838FF333333FF414141FF797979FF7979
          79FF787878FF777777FF767676FF767676FF757575FF787878FF393939FF1515
          15FF171717FF0A0A0AFF404040FFC1C1C1FF1B1B1B7D00000000000000016666
          66BADFDFDFFF4B4B4BFF3B3B3BFF3B3B3BFF2F2F2FFF707070FFE2E2E2FFDCDC
          DCFFE0E0E0FFE3E3E3FFE7E7E7FFEAEAEAFFEEEEEEFFFEFEFEFF8C8C8CFF0E0E
          0EFF191919FF161616FF101010FFA0A0A0FF5B5B5BC60000000700000015B0B0
          B0E4B2B2B2FF3F3F3FFF3F3F3FFF3D3D3DFF323232FF747474FFDDDDDDFFCDCD
          CDFFCFCFCFFFD3D3D3FFD6D6D6FFDADADAFFDDDDDDFFECECECFF8A8A8AFF1212
          12FF1C1C1CFF191919FF0B0B0BFF6A6A6AFF9E9E9EF60101012B04040430CECE
          CEF9AEAEAEFF5F5F5FFF3C3C3CFF404040FF343434FF777777FFEBEBEBFFD7D7
          D7FFCFCFCFFFCECECEFFD2D2D2FFD5D5D5FFD8D8D8FFE7E7E7FF8A8A8AFF1515
          15FF1E1E1EFF1B1B1BFF111111FF454545FFB8B8B8FF0909095208080842D6D6
          D6FFB4B4B4FFA1A1A1FF595959FF3C3C3CFF363636FF7C7C7CFFF7F7F7FFE4E4
          E4FFD9D9D9FFCFCFCFFFCDCDCDFFD1D1D1FFD4D4D4FFE3E3E3FF8A8A8AFF1818
          18FF212121FF1E1E1EFF161616FF383838FFBFBFBFFF0F0F0F6408080841D2D2
          D2FFB8B8B8FFB1B1B1FFA4A4A4FF666666FF343434FF7C7C7CFFFFFFFFFFF1F1
          F1FFE6E6E6FFDCDCDCFFD3D3D3FFCDCDCDFFD0D0D0FFDEDEDEFF8A8A8AFF1B1B
          1BFF232323FF202020FF181818FF3B3B3BFFC5C5C5FF0F0F0F630303032DC4C4
          C4F8BABABAFFB8B8B8FFAEAEAEFFAAAAAAFF787878FF8B8B8BFFFFFFFFFFFCFC
          FCFFF3F3F3FFE9E9E9FFDFDFDFFFD5D5D5FFCECECEFFD9D9D9FF898989FF1D1D
          1DFF242424FF232323FF1E1E1EFF545454FFC5C5C5FF0808084E00000013A4A4
          A4E0BFBFBFFFBDBDBDFFB4B4B4FFAFAFAFFFA7A7A7FFC1C1C1FFFFFFFFFFFFFF
          FFFFFEFEFEFFF7F7F7FFEDEDEDFFE2E2E2FFD8D8D8FFD9D9D9FF8A8A8AFF2626
          26FF393939FF3F3F3FFF2F2F2FFF878787FFADADADF201010126000000005E5E
          5EB2D3D3D3FFC6C6C6FFBEBEBEFFB6B6B6FFACACACFFC3C3C3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFF8F8F8FFF1F1F1FFF1F1F1FFA5A5A5FF5555
          55FF585858FF4E4E4EFF3E3E3EFFCACACAFF616161BF00000004000000001010
          1055D9D9D9FFBBBBBBFFCFCFCFFFBDBDBDFFB8B8B8FFB5B5B5FFC4C4C4FFC3C3
          C3FFBFBFBFFFBABABAFFB6B6B6FFB1B1B1FFABABABFFA5A5A5FF7D7D7DFF6767
          67FF606060FF4F4F4FFF777777FFEFEFEFFF1919197300000000000000000000
          0008696969BDCBCBCBFFC4C4C4FFCCCCCCFFBFBFBFFFB9B9B9FFAFAFAFFFA7A7
          A7FFA0A0A0FF999999FF929292FF8A8A8AFF838383FF7B7B7BFF787878FF7272
          72FF696969FF585858FFD6D6D6FF898989DB0000001800000000000000000000
          000004040433C5C5C5F6BEBEBEFFCECECEFFCECECEFFC0C0C0FFBBBBBBFFB4B4
          B4FFAEAEAEFFA7A7A7FFA0A0A0FF999999FF929292FF8B8B8BFF838383FF7B7B
          7BFF676767FFBEBEBEFFDFDFDFFF090909510000000000000000000000000000
          00000000000016161663D1D1D1FDBFBFBFFFC4C4C4FFD4D4D4FFC5C5C5FFBBBB
          BBFFB6B6B6FFAFAFAFFFA9A9A9FFA2A2A2FF9B9B9BFF949494FF8B8B8BFF7D7D
          7DFFC4C4C4FFF0F0F0FF2020207C000000000000000000000000000000000000
          0000000000000000000015151561CBCBCBFACCCCCCFFBBBBBBFFCCCCCCFFCACA
          CAFFC2C2C2FFBCBCBCFFB5B5B5FFACACACFFA3A3A3FF9B9B9BFF9F9F9FFFE1E1
          E1FFE2E2E2FF2020207E00000000000000000000000000000000000000000000
          000000000000000000000000000006060639686868BFD7D7D7FFD1D1D1FFC6C6
          C6FFBABABAFFBDBDBDFFBBBBBBFFB4B4B4FFC3C3C3FFDFDFDFFFE8E8E8FF8080
          80D2090909490000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000711111159606060B6A6A6
          A6E4C6C6C6F9D2D2D2FFD4D4D4FFCFCFCFFBB1B1B1E86C6C6CC0161616670000
          000C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          00140404042F0808084509090946040404330000001800000002000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000003020202301616
          16703434349F4A4A49B84A4A49BA393939A81C1C1C7F050505400000000C0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000006060644515150B7BFBFB8F9DDDD
          CFFFD1D1C8FFBEBEC2FFB7B7BDFFBCBCB7FFC2C2B4FFAFAFA4FF5E5E5DCF0E0E
          0F63000000080000000000000000000000000000000000000000000000000000
          000000000000000000000000000A2D2D2D90DADAD3FFEBEBE3FF9494BDFF4040
          B9FF1616C8FF0505D8FF0303DCFF0F0FD3FF2C2CC2FF6868ACFFAEAEAEFFBDBD
          AFFF464645B90101012400000000000000000000000000000000000000000000
          0000000000000101011F666666C2F8F8EFFF9C9CC7FF2121BCFF0000D8FF0000
          ECFF0000F1FF0000F4FF0000F7FF0000FCFF0000FFFF0000F9FF0C0CD8FF5B5B
          B3FFBCBCB2FF7E7E7BE506060643000000000000000000000000000000000000
          00000000000E636363C1FFFFFDFF6B6BB4FF0000C5FF0000DFFF0000E1FF0000
          E6FF0000ECFF0000F0FF0000F4FF0000F8FF0000FAFF0000FDFF0000FFFF0000
          FCFF2E2EBBFFBDBDB4FF82827FE9020202300000000000000000000000000000
          00002D2D2D8FFCFCF1FF7070AFFF0000C1FF0000D4FF0000D8FF0000DFFF0000
          E5FF0000EAFF0000EFFF0000F4FF0000F8FF0000FBFF0000FEFF0000FFFF0000
          FEFF0000FFFF2A2AB9FFBEBEB4FF565655CC0000000D00000000000000000303
          032FD4D4CEF9B3B3C9FF0000B5FF0000CCFF0000CFFF0000D6FF0000DDFF0000
          E3FF0000E9FF0000EEFF0000F3FF0000F7FF0000FBFF0000FEFF0000FEFF0000
          FCFF0000FCFF0000FAFF5F5FB0FFBEBEB0FF0E0E0E6100000000000000003434
          348FF3F3E8FF4040ABFF0000C4FF0000C5FF0000CCFF0000D3FF0000DAFF0000
          E1FF0000E7FF0000ECFF0000F1FF0000F5FF0000F8FF0000FBFF0000FBFF0000
          FAFF0000F9FF0000FEFF0909D4FFA7A7ACFF5C5C5ACE0000000D00000017A5A5
          A3E4B7B7C5FF0505B3FF0000C1FF0000C0FF0000C6FF0000CFFF0000D6FF0000
          DDFF0000E3FF0000E9FF0000EEFF0000F2FF0000F5FF0000F7FF0000F8FF0000
          F8FF0000F7FF0000F6FF0000F8FF5656AFFFAFAFA2FF0606064808080845E2E2
          D9FF7E7EB2FF0000BAFF0505BEFF2F2FCAFF3333CDFF3232D3FF3232D8FF3131
          DEFF3131E2FF3030E5FF3131EAFF3131EDFF3131F0FF3131F2FF3232F3FF3232
          F3FF3333F3FF1010F3FF0000FAFF1F1FC4FFB8B8ADFF202020861C1C1C6CE2E2
          DCFF8F8FBEFF1212C1FF3D3DC9FFFBFBF1FFF1F1EAFFEBEBE6FFE6E6E1FFE2E2
          DCFFDDDDD7FFD8D8D2FFD5D5CFFFD6D6D0FFD9D9D2FFDBDBD4FFDDDDD6FFDEDE
          D8FFEDEDD9FF7D7DEBFF0000F5FF0A0AD8FFB0B0B6FF40403FB02C2C2C82DFDF
          DBFF9F9FCBFF6565D8FF6565D3FFFEFEF7FFF1F1F0FFECECEBFFE7E7E6FFE2E2
          E1FFDDDDDDFFD8D8D8FFD3D3D3FFCECECEFFCDCDCCFFCECECEFFD0D0D0FFD3D3
          D2FFE2E2D3FF8383E6FF0000F0FF0505E1FFAFAFC1FF51514EC02A2A2A7FDCDC
          D9FFA4A4CAFF8484DFFFABABE7FFFFFFFFFFFCFCFAFFF7F7F5FFF3F3F1FFEFEF
          ECFFEAEAE7FFE5E5E2FFE0E0DDFFDBDBD8FFD6D6D3FFD1D1CEFFCFCFCCFFD0D0
          CDFFE0E0CFFF8585E2FF0000EBFF0505DBFFB5B5C5FF51514EBE18181864D9D9
          D6FFAFAFC3FF9090E2FFA4A4E4FFF4F4FCFFF7F7FDFFF1F1FAFFE1E1F3FFDFDF
          F0FFDFDFEEFFDDDDEBFFD9D9E7FFD5D5E3FFD1D1E0FFCDCDDCFFC9C9D8FFC5C5
          D5FFCFCFD5FF6666E1FF0101E8FF1515C9FFC3C3C4FF3D3D3CA80505053ACDCD
          CBFCBABABFFFA5A5E4FF9090DDFF9292DFFF8E8EDFFF8585DEFF6161D5FF3333
          CAFF1919C6FF1010CAFF0D0DCEFF0E0ED3FF0E0ED6FF0F0FD9FF1212DCFF1818
          DFFF2222E1FF1B1BE1FF1313E5FF3B3BB8FFD3D3C8FF1A1A1A780000000F8B8B
          8AD7C7C7C4FFB4B4DBFF9B9BE2FF9494DEFF8C8CDDFF8585DCFF8181DDFF7878
          DCFF6565D8FF4E4ED4FF3C3CD2FF3030D3FF2D2DD5FF2E2ED8FF3333DAFF3535
          DCFF3232DDFF2D2DDEFF1717D9FF8383B8FFC3C3BBFD03030339000000002525
          2579D8D8D6FFB8B8C3FFAFAFE9FF9E9EE0FF9898E0FF9191DEFF8989DEFF8282
          DDFF7C7CDDFF7676DCFF7070DCFF6969DBFF6161DBFF5858DBFF4F4FDBFF4646
          DBFF3E3EDCFF3232E2FF3A3ABBFFE1E1DEFF545453B900000006000000000101
          011EAEAEAEECC6C6C3FFC1C1D9FFACACE9FFA1A1E1FF9B9BE1FF9393DFFF8B8B
          DEFF8484DDFF7D7DDDFF7575DCFF6E6EDCFF6666DBFF5F5FDBFF5757DBFF5050
          DBFF4848DFFF3131CFFFA9A9CAFFE4E4DCFF0707074800000000000000000000
          00001919196AD8D8D8FFB6B6B4FFC3C3E0FFADADE8FFA3A3E2FF9C9CE1FF9595
          E0FF8E8EDFFF8686DEFF7E7EDDFF7777DCFF7070DCFF6868DCFF6060DBFF5959
          DFFF4545D5FF7D7DB4FFFCFCF5FF414141AA0000000400000000000000000000
          0000000000013F3F3F9AE1E1E0FFB7B7B7FFC4C4DCFFB5B5ECFFA4A4E5FF9C9C
          E1FF9696E0FF8F8FDFFF8888DFFF8080DEFF7878DDFF7070DEFF6767E1FF5A5A
          D0FF8C8CB7FFFFFFF9FF727272CC000000160000000000000000000000000000
          0000000000000000000B4343439CD5D5D4FFC1C1BFFFBDBDC8FFB8B8DBFFB2B2
          E8FFA5A5E8FF9A9AE5FF9191E3FF8B8BE3FF8585E1FF7A7AD2FF8181C2FFB8B8
          C5FFF5F5EEFF6E6E6EC601010125000000000000000000000000000000000000
          00000000000000000000000000001313135DA5A5A5E4DBDBDAFFC6C6C4FFBABA
          BDFFB7B7C4FFB5B5CCFFAFAFCDFFA7A7C3FFACACBEFFC7C7C9FFEEEEE8FFD0D0
          CDF8292929860000000A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000001C2B2B2B81919191D7D4D4
          D3FFDCDCDAFFDEDEDBFFE1E1DEFFE4E4E0FFE2E2DFFFABABAAE64141419D0303
          0333000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000E0606
          063C181818662A2A2A812C2C2C841D1D1D6F0A0A0A4800000018000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000100040210
          072C0F3C21752B804DAD061C0C42000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000002000702110730134226764F9A72D57DD0
          9CFF99DDAFFF5AD79BFF4DB663E3000100040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000003010903140934143C2578519B73DA79CD98FF9AD39BFF75B456FF3C8E
          05FF6EB25AFF5ED39CFF4BB060E4000100040000000000000000000000000000
          000000000000000000000000000000000000000000000003010A0720104F1B47
          308A5DA17CDC7ECA94FF81C47AFF6AAE46FF358B01FF278300FF3B900DFF2E88
          00FF6CB25BFF5BCD97FF48AC5CE4000100040000000000000000000000000000
          000000000000000000000002000C0C2717522D55438E6FAA8EDF87CE9AFF7FC2
          75FF66AA3DFF338A01FF268300FF49981CFF87BC6AFFC3DFB4FFF0F8ECFF3C90
          0BFF6AB058FF58C891FF46A759E4000100040000000000000000000000000000
          0000000000000105032984AF9EDEB6E3C1FF77BB65FF57A22BFF308900FF2885
          00FF559F2BFFA4CB8DFFD8EACEFFFFFFFDFFFFFFFFFFEAEEEDFFD0DECFFF3F93
          0DFF6BAF59FF55C18CFF43A256E3000100040000000000000000000000000000
          0000000000000C181256B2E3B6FF63A535FF469616FF63A73EFFB2D49FFFDEED
          D6FFFFFFFFFFFFFFFFFFEAF0EBFF82A486FF4A7B4DFF0E5110FF7DA37AFF499A
          17FF6CAF5AFF52BC87FF419E54E3000100030000000000000000000000000000
          0000000000000A1510539DD49FFF70AE49FFE9F3E3FFFFFFFFFFFFFFFFFFFAFB
          FBFFD5E1D6FF8DAD8CFF478048FF759E75FF055000FF296B20FFD8E5D4FF3E92
          0CFF6EB05CFF52BB86FF3E9951E2000100030000000000000000000000000000
          0000000000000A140F559BD29DFF7DB559FFF1F5F1FFD7E2D8FF86A885FF2A68
          28FF14580EFF015300FF8AB688FF5A914DFF0E5F00FFA8C5A0FFFDFFFBFF398E
          06FF73B865FF60D79EFF3C964EE2000100030000000000000000000000000000
          0000000000001E271C6B97CC98FF8BBE68FF8AAD87FF4D8349FF4F8648FF3776
          2BFF0E6100FF63A55CFF90B883FF136800FF166E00FF619E49FFFAFDF8FF388E
          05FF77B968FF5ED199FF39914BE2000100030000000000000000000000000000
          0000000000004F584E778FC28EFF8DBF6CFFD0DFCBFF6C9E60FF5E974EFF5D96
          49FF519D43FFB3D4AAFF287B07FF459023FF65A446FFA4C992FFF6FAF3FF388E
          05FF79B96CFF58C891FF328843E2010201030000000000000000000000000000
          000000000000576056748EBE8DFF8EC06FFFFEFFFEFFE3EDE0FF79AC62FF67A9
          50FFC2E4BCFF529A2EFF2B8600FFB9D7A8FFFFFFFFFFFFFFFFFFF1F6EDFF378E
          04FF7BB96EFF54C18AFF308541E2010201030000000000000000000000000000
          000000000000555E567292C090FF93C276FFFBFDF9FFFFFFFFFFD6EACFFFA9DA
          A1FFAFD29BFF4E9B22FF2C8800FF3C9111FFC5DEB7FFFFFFFFFFF0F5E9FF378E
          04FF7CB86FFF51B982FF338544E2000100030000000000000000000000000000
          0000000000004F52437199C79AFF99C57CFFFBFDFAFFFFFFFFFFD3F2D4FFC7E3
          BDFF71AE4DFF70B14FFF459618FF2A8500FF318B08FFC4DCB3FFF5F5EDFF378D
          03FF7EB771FF4DB27BFF318141E2000100030000000000000000000000000000
          0000000000005054486F9EC99FFF9EC883FFFFFEFEFFDFF6E0FFCBEBC8FF8CBD
          6EFF88BB69FF9FD897FF6ABE59FF33A014FF2A9806FF6FB350FFF7F5EDFF368E
          03FF7FB671FF46A970FF328142E2010101030000000000000000000000000000
          000000000000535B536DA1C8A0FFA5CC8CFFEFFAEFFFCFF2D1FFA9CE93FF7AB4
          58FFD2E5C6FFFEFFFFFFB5E8B6FFB8E4B3FFD5E9CBFFF0F2E5FFEEEEE0FF368E
          02FF7FB570FF3CA162FF348245E2010202030000000000000000000000000000
          0000000000004B4B3C6BA6CBA7FFAED196FFD8F2D8FFB1D9A4FFADD198FFD3E6
          C8FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFEFFEAEAD8FF358D
          00FF80B570FF359C58FF2E7D40E2010201030000000000000000000000000000
          00000000000050554D69AACBA8FFAFD299FFF7FBF5FFFBFCF9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFBFBF8FFE4EDDAFFCADEB9FFB0D098FF68A841FF2484
          00FF7FB472FF2C984DFF29793BE2010201030000000000000000000000000000
          0000000000004D4F4567AECDADFFB5D6A0FFFCFDFBFFFFFFFFFFFAFCF9FFE4F0
          DDFFCEE4C2FFB8D7A6FF96C47BFF80B860FF7BB658FF82B960FF9AC57CFFA1C7
          84FF9AC396FF3FA45BFF257838E2010201030000000000000000000000000000
          00000000000047443465B4D1B4FFB7D7A3FFD5E7CAFFC1DDB2FFA8CF92FF9BC8
          81FF99C67DFF9FCA85FFB3D49FFFB9D4AAFFB1CCAAFFB2CDB3FFAFCEB7FF94C4
          A4FF65B57BFF4CB163FF1B6A2EDB000000000000000000000000000000000000
          0000000000004F524B63B8D1B6FFBADAA6FFB4D6A0FFBDDAACFFCEE3C3FFCEE0
          C9FFBED2BEFFB2CAB8FFA5C1B1FF89B397FF6CAB7FFF4E9B62FF38864BFF2D7D
          40F6286637C7173F218802110631000000000000000000000000000000000000
          0000000000003D433861CAD9CBFFDCE7D8FFC9D9CAFFB8CEBEFF9DBBA8FF7AA7
          88FF599669FF458755FF468655FB437C4FE6315231BF1B2D1E5A1621193B080E
          0A1C000000000000000000000000000000000000000000000000000000000000
          0000000000001E251C4196B19DFB73A17FFF4D885BFF3E7D4CFF3F764AF0587F
          5FD8687969A64C504B5F212221240909090A0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000020241E33627460AD676D638A3838353E131212130303
          0303000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object JvTimer: TJvTimer
    Enabled = False
    Interval = 5000
    OnTimer = JvTimerTimer
    Left = 456
    Top = 168
  end
  object ZROQReconocimientoCount: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      'select max(cp.cuenta_piloto) cuenta from ('
      'select count(distinct p.oid) as cuenta_piloto'
      'from toma_tiempos_reconocimiento tt '
      
        '     join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = ' +
        'tte.oid '
      '     join piloto p on tt.piloto_oid = p.oid '
      '     join inscripcion_piloto_evento ipe on '
      
        '          (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = ' +
        'tt.piloto_oid) '
      'where tte.oid = :toma_tiempo_evento_oid'
      
        'group by sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, tte.evento_oid, ipe.piloto_oid)) cp'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
    Left = 424
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 104
    Top = 336
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object JvTimerCount: TJvTimer
    Enabled = False
    OnTimer = JvTimerCountTimer
    Left = 400
    Top = 168
  end
  object QueryCategoriasFilter: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select distinct cat.oid, cat.nombre'
      'from toma_tiempos_reconocimiento tt'
      
        '     join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = ' +
        'tte.oid'
      '     join piloto p on tt.piloto_oid = p.oid, categorias cat '
      
        'where sel_categoria_oid_by_evento_and_tipo_categoria((select min' +
        '(ipe.tipo_categoria_oid)'
      
        '                                               from inscripcion_' +
        'piloto_evento ipe'
      
        '                                               where ipe.evento_' +
        'oid = tte.evento_oid '
      
        '                                               and ipe.piloto_oi' +
        'd = p.oid), tte.evento_oid, p.oid) = cat.oid'
      'and tte.oid = :toma_tiempo_evento_oid'
      'and tt.is_deleted = 0'
      'order by  cat.orden is null, cat.orden asc;'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end>
    Left = 552
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end>
  end
  object ZROQPosiciones1: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      ''
      
        'SELECT 0 as posicion, sel_nro_moto_by_evento_and_tipo_categoria(' +
        'ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto' +
        ', '
      
        ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_cate' +
        'goria_oid, tte.evento_oid, ipe.piloto_oid) categoria,'
      
        ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_o' +
        'id, tt.piloto_oid)) formated_tiempo_sec, '#39#39' as nombre_piloto,'#39#39' ' +
        'AS localidad,'
      '0 as  max_nro_vuelta, 0 as handicup, 0 as recargo'
      ' from toma_tiempos tt'
      
        ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.' +
        'oid '
      ' join piloto p on tt.piloto_oid = p.oid '
      
        ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.eve' +
        'nto_oid and ipe.piloto_oid = tt.piloto_oid) '
      ' where tte.oid = :toma_tiempo_evento_oid'
      
        '        and (:categoria_oid is null or :categoria_oid = 0 or :ca' +
        'tegoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe' +
        '.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) '
      ' group by p.oid '
      
        ' order by sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_o' +
        'id) desc,  '
      
        '       sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) ' +
        'asc, tt.oid asc'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
    Left = 32
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
  end
  object ZROQPosiciones2: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      ''
      
        'SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, '
      
        ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_cate' +
        'goria_oid, tte.evento_oid, ipe.piloto_oid) categoria,'
      
        ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_o' +
        'id, tt.piloto_oid)) formated_tiempo_sec'
      ' from toma_tiempos tt'
      
        ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.' +
        'oid '
      ' join piloto p on tt.piloto_oid = p.oid '
      
        ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.eve' +
        'nto_oid and ipe.piloto_oid = tt.piloto_oid) '
      ' where tte.oid = :toma_tiempo_evento_oid'
      
        '        and (:categoria_oid is null or :categoria_oid = 0 or :ca' +
        'tegoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe' +
        '.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) '
      ' group by p.oid '
      
        ' order by sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_o' +
        'id) desc,  '
      
        '       sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) ' +
        'asc, tt.oid asc'
      ''
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
  end
  object ZROQPosiciones3: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      ''
      
        'SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, '
      
        ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_cate' +
        'goria_oid, tte.evento_oid, ipe.piloto_oid) categoria,'
      
        ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_o' +
        'id, tt.piloto_oid)) formated_tiempo_sec'
      ' from toma_tiempos tt'
      
        ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.' +
        'oid '
      ' join piloto p on tt.piloto_oid = p.oid '
      
        ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.eve' +
        'nto_oid and ipe.piloto_oid = tt.piloto_oid) '
      ' where tte.oid = :toma_tiempo_evento_oid'
      
        '        and (:categoria_oid is null or :categoria_oid = 0 or :ca' +
        'tegoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe' +
        '.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) '
      ' group by p.oid '
      
        ' order by sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_o' +
        'id) desc,  '
      
        '       sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) ' +
        'asc, tt.oid asc'
      ''
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
  end
  object ZROQPosiciones4: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      ''
      
        'SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, '
      
        ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_cate' +
        'goria_oid, tte.evento_oid, ipe.piloto_oid) categoria,'
      
        ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_o' +
        'id, tt.piloto_oid)) formated_tiempo_sec'
      ' from toma_tiempos tt'
      
        ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.' +
        'oid '
      ' join piloto p on tt.piloto_oid = p.oid '
      
        ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.eve' +
        'nto_oid and ipe.piloto_oid = tt.piloto_oid) '
      ' where tte.oid = :toma_tiempo_evento_oid'
      
        '        and (:categoria_oid is null or :categoria_oid = 0 or :ca' +
        'tegoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe' +
        '.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) '
      ' group by p.oid '
      
        ' order by sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_o' +
        'id) desc,  '
      
        '       sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) ' +
        'asc, tt.oid asc'
      ''
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
    Left = 544
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
  end
  object ZROQPosiciones5: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      ''
      
        'SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, '
      
        ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_cate' +
        'goria_oid, tte.evento_oid, ipe.piloto_oid) categoria,'
      
        ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_o' +
        'id, tt.piloto_oid)) formated_tiempo_sec'
      ' from toma_tiempos tt'
      
        ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.' +
        'oid '
      ' join piloto p on tt.piloto_oid = p.oid '
      
        ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.eve' +
        'nto_oid and ipe.piloto_oid = tt.piloto_oid) '
      ' where tte.oid = :toma_tiempo_evento_oid'
      
        '        and (:categoria_oid is null or :categoria_oid = 0 or :ca' +
        'tegoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe' +
        '.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) '
      ' group by p.oid '
      
        ' order by sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_o' +
        'id) desc,  '
      
        '       sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) ' +
        'asc, tt.oid asc'
      ''
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
    Left = 704
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
  end
  object ZROQPosiciones6: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      ''
      
        'SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, '
      
        ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_cate' +
        'goria_oid, tte.evento_oid, ipe.piloto_oid) categoria,'
      
        ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_o' +
        'id, tt.piloto_oid)) formated_tiempo_sec'
      ' from toma_tiempos tt'
      
        ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.' +
        'oid '
      ' join piloto p on tt.piloto_oid = p.oid '
      
        ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.eve' +
        'nto_oid and ipe.piloto_oid = tt.piloto_oid) '
      ' where tte.oid = :toma_tiempo_evento_oid'
      
        '        and (:categoria_oid is null or :categoria_oid = 0 or :ca' +
        'tegoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe' +
        '.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) '
      ' group by p.oid '
      
        ' order by sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_o' +
        'id) desc,  '
      
        '       sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) ' +
        'asc, tt.oid asc'
      ''
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
    Left = 872
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
  end
  object ZROQPosiciones7: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      ''
      
        'SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, '
      
        ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_cate' +
        'goria_oid, tte.evento_oid, ipe.piloto_oid) categoria,'
      
        ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_o' +
        'id, tt.piloto_oid)) formated_tiempo_sec'
      ' from toma_tiempos tt'
      
        ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.' +
        'oid '
      ' join piloto p on tt.piloto_oid = p.oid '
      
        ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.eve' +
        'nto_oid and ipe.piloto_oid = tt.piloto_oid) '
      ' where tte.oid = :toma_tiempo_evento_oid'
      
        '        and (:categoria_oid is null or :categoria_oid = 0 or :ca' +
        'tegoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe' +
        '.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) '
      ' group by p.oid '
      
        ' order by sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_o' +
        'id) desc,  '
      
        '       sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) ' +
        'asc, tt.oid asc'
      ''
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
    Left = 1016
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end>
  end
  object DSPosiciones1: TDataSource
    DataSet = ZROQPosiciones1
    Left = 104
    Top = 392
  end
  object DSPosiciones2: TDataSource
    DataSet = ZROQPosiciones2
    Left = 272
    Top = 392
  end
  object DSPosiciones3: TDataSource
    DataSet = ZROQPosiciones3
    Left = 448
    Top = 392
  end
  object DSPosiciones4: TDataSource
    DataSet = ZROQPosiciones4
    Left = 616
    Top = 384
  end
  object DSPosiciones7: TDataSource
    DataSet = ZROQPosiciones7
    Left = 1088
    Top = 384
  end
  object DSPosiciones6: TDataSource
    DataSet = ZROQPosiciones6
    Left = 944
    Top = 384
  end
  object DSPosiciones5: TDataSource
    DataSet = ZROQPosiciones5
    Left = 776
    Top = 384
  end
  object ZReSetPosition: TZQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      'SET @posicion=:posicion;')
    Params = <
      item
        DataType = ftInteger
        Name = 'posicion'
        ParamType = ptInput
      end>
    Left = 592
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'posicion'
        ParamType = ptInput
      end>
  end
  object frxPosiciones1: TfrxReport
    Version = '4.12.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41337.365820405100000000
    ReportOptions.LastChange = 45749.683244421300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 40
    Top = 272
    Datasets = <
      item
        DataSet = campeonato1DBDS
        DataSetName = 'campeonato1DBDS'
      end
      item
        DataSet = eventoDBDS
        DataSetName = 'eventoDBDS'
      end
      item
        DataSet = posiciones1DBDS
        DataSetName = 'posiciones1DBDS'
      end
      item
        DataSet = tomaTiempoDBDS
        DataSetName = 'tomaTiempoDBDS'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Reporte: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftTop]
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 268.346630000000000000
        Width = 816.000527000000000000
        DataSet = posiciones1DBDS
        DataSetName = 'posiciones1DBDS'
        RowCount = 0
        object posiciones1DBDSnro_moto: TfrxMemoView
          Left = 56.692950000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nro_moto'
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clNone
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Color = cl3DLight
          Highlight.Condition = '<Line>mod 2 = 1'
          Memo.UTF8W = (
            '[posiciones1DBDS."nro_moto"]')
          ParentFont = False
        end
        object posiciones1DBDSformated_tiempo_sec: TfrxMemoView
          Left = 464.882190000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'formated_tiempo_sec'
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clNone
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Color = cl3DLight
          Highlight.Condition = '<Line>mod 2 = 1'
          Memo.UTF8W = (
            '[posiciones1DBDS."formated_tiempo_sec"]')
          ParentFont = False
        end
        object posiciones1DBDSnombre_piloto: TfrxMemoView
          Left = 120.944960000000000000
          Width = 158.740128190000000000
          Height = 18.897405910000000000
          ShowHint = False
          DataField = 'nombre_piloto'
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clNone
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Color = cl3DLight
          Highlight.Condition = '<Line>mod 2 = 1'
          Memo.UTF8W = (
            '[posiciones1DBDS."nombre_piloto"]')
          ParentFont = False
        end
        object posiciones1DBDSposicion: TfrxMemoView
          Left = 1.700788500000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'posicion'
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clNone
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Color = cl3DLight
          Highlight.Condition = '<Line>mod 2 = 1'
          Memo.UTF8W = (
            '[posiciones1DBDS."posicion"]')
          ParentFont = False
        end
        object posiciones1DBDSmax_nro_vuelta: TfrxMemoView
          Left = 548.031850000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'max_nro_vuelta'
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clNone
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Color = cl3DLight
          Highlight.Condition = '<Line>mod 2 = 1'
          Memo.UTF8W = (
            '[posiciones1DBDS."max_nro_vuelta"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 279.685220000000000000
          Width = 185.196838190000000000
          Height = 18.897405910000000000
          ShowHint = False
          DataField = 'localidad'
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clNone
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Color = cl3DLight
          Highlight.Condition = '<Line>mod 2 = 1'
          Memo.UTF8W = (
            '[posiciones1DBDS."localidad"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 600.945270000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'handicup'
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clNone
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Color = cl3DLight
          Highlight.Condition = '<Line>mod 2 = 1'
          Memo.UTF8W = (
            '[posiciones1DBDS."handicup"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 676.535870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'recargo'
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clNone
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Color = cl3DLight
          Highlight.Condition = '<Line>mod 2 = 1'
          Memo.UTF8W = (
            '[posiciones1DBDS."recargo"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 143.622140000000000000
        Top = 18.897650000000000000
        Width = 816.000527000000000000
        object posiciones1DBDScategoria: TfrxMemoView
          Left = 90.708720000000000000
          Top = 113.385900000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'categoria'
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[posiciones1DBDS."categoria"]')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 559.370440000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[Date]')
        end
        object Time: TfrxMemoView
          Left = 559.370440000000000000
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Left = 506.457020000000000000
          Top = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Fecha:')
        end
        object Memo4: TfrxMemoView
          Left = 506.457020000000000000
          Top = 26.456710000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Hora:')
        end
        object campeonato1DBDSnombre: TfrxMemoView
          Left = 98.267780000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nombre'
          DataSet = campeonato1DBDS
          DataSetName = 'campeonato1DBDS'
          Memo.UTF8W = (
            '[campeonato1DBDS."nombre"]')
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Campeonato:')
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Evento:')
        end
        object eventoDBDSnombre: TfrxMemoView
          Left = 98.267780000000000000
          Top = 26.456710000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nombre'
          DataSet = eventoDBDS
          DataSetName = 'eventoDBDS'
          Memo.UTF8W = (
            '[eventoDBDS."nombre"]')
        end
        object Memo10: TfrxMemoView
          Top = 113.385900000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Categoria:'
            '')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 472.441250000000000000
          Top = 113.385900000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = posiciones1DBDS
          DataSetName = 'posiciones1DBDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[tomaTiempoDBDS."nombre"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 351.496290000000000000
          Top = 113.385900000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Toma Tiempo:'
            '')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 691.653990000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 94.488250000000000000
          ShowHint = False
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000100
            0000010008060000005C72A866000000017352474200AECE1CE9000000046741
            4D410000B18F0BFC6105000000097048597300000B1000000B1001AD23BD7500
            000006624B4744000000000000F943BB7F000000097670416700000100000001
            0000B267DC8A000000287A545874536F667477617265000078DAF34D4C2ECACF
            4D4DC94C5470CB2C4A2DCF2FCA2E56B00000601508278283368B0000A7A24944
            4154785EED9D05785CE795FE9BECF6BFE5C5C26EBBA5ED6E999B362937691A6A
            9899D9891D33CA02335BB2245BCC64315A26D9962D3333C5760C491C70B04D1B
            38FFF39EEF9E3BDFBDFA46B213C738F779DEDC996F468A35737FEF39E7A3FB11
            228A29A698CE52391B638A29A6B343CEC698628AE9EC90B331A698623A3BE46C
            8C29A698CE0E391B638A29A6B343CEC698628AE9EC90B331A698623A3BE46C8C
            E9D4D1C4A929FF909691FD3F691959BF4BCDC8BA8275F9B41999BF4D9D91F9CD
            A9A9E91F75FD4C4C311DAD9C8D319D5C8D9F9A724E4E41D10F3372F21EC9C8CD
            2FC92F2EDD565251F96645550DB1DE2BABAC7AA3B0B47CF78C9CBCB2E959390F
            67E7177E7FE4F8C9E7B87E574C31752567634C2747B3E6CE3F674676EEED0C76
            5B6E61F13B5575F5D4DEB18C76ECDE4DCFBFF002BDFAEA6BF4EA6BAFD14B2FBD
            447BF73D432B56AFA1869659C406F1F68CECBCB6B4CCEC874B67567DC2F5BB63
            8AC92567634C275E5979059732FC1DC56515B4B07D091D3C7488DE7EFB6D7EA9
            EBE3DD77DFA5975E3E42CB57ADA28AEA1AE28C6043665EC1E5FC92F3FF13534C
            B69C8D319D38716AFF198EF819794525B498A3FD9123AF7073F078EF3DD57B01
            718B798377BCF997BFD0AA356BA9A8AC9CD233B3D30A4ACA3ECDCDCEFF6F4C31
            41CEC6984E8C3875FF12D7F94B2B6BEB68FF8183DC640E41DB87DEA5A0117053
            C00A0EBFF822D535B5101BCB52CE2CBEC64DCEFF7F4C31391B63FAF0555852FE
            CDE9D9B9DB1A5B5AE92F7FFD2B37050F85DA29FE8F4BF681F201A5049BC0A19C
            C2E24BB8C9F9EF88E9EC96B331A60F571CF9BF90919BB7B59EA3F49B6FFE859B
            BA3EC07654F17F5C068003FD036202D979AF64E717FE9C9B9CFF9E98CE5E391B
            63FAF0346F61FBB90C644B5D5333BDF5D65BDCF4C10EDF083C850F9408182D98
            919DBB373337FF07DCE4FC77C57476CAD918D38727AEC97B1797CFA4978F1CE1
            A70650446A480FB41DEF63D98A9528079EE14C20660231F97236C6F4E1282BAF
            F0CB0CE00B1B366DE2A744EFBCF38E2F350195DFC1771CCD60299B40466EFE1E
            36A1EFF253E7BF31A6B34BCEC6983E1C710A9E52D76852FFBFFFFDEFF4B7BFFD
            4D84C7E8B4537D98C6B06CE52ACAC8C93B985350FC6B7EEAFC77C674F6C8D918
            D3F1574149D9D738FAFF65EBF61D0CF27BF4D7BFFE8D8DC0488DC0360455D814
            A299C1B11802E61B64E4E4BF92935F183381B35CCEC6988EBFB272F3FB57D6D4
            D191575E15C831F4A7FAEB5FDF0AC86D0CC818DCA670AC99025EEF58B69C3823
            39949D57F0236E72FE9B633AF3E56C8CE9F88B619BBB60D1627AEDF5D7456FBC
            F9A62FCCE0835C86A066F0163206D6DF2C63B03305DB18C206E032011CCB4D39
            B0974DE0DBFCD4F9EF8EE9CC96B331A6E3AB4953933F515456BE65D5DAF5F4FC
            E117E8C5975E96453D6A06AFBFF146446FBE614CE1CDE8A6D0C91C2C53506308
            6709E1CC400F9840565EFEDE9C82C21FF253E7BF3FA63357CEC6988EAF52D2A7
            7FADB6B1E9F98D5BB6D2DE67F6D3C1E79EA7175E7C895E91D57DAFFB5243E864
            0A2CC916FE62B285BFFC854D010A998179AC86102919DE79A7B319D826604607
            F29E6113F8313F75FE0D319D997236C6747C353D33FB97B3E6CC7B0F06B07DD7
            2E7AFA9967E8C0A167E9309BC0113601184157661036844EE5C35FA3970F6A02
            7FFFBB3B23D063D9F295949D5FF8527E51C9C5FCD4F977C474E6C9D918D3F155
            4656CE25B3E72FA0351B37D2063681AD3B76D1EE3D7BE9998387649DFFCB475E
            A123AF40AFFA5253081B43D81C5CC6E0F7297096F0D7B7D80C58620462066FB3
            DE61338011BC2BD26349C752740CBE9257581CEB183C4BE46C8CE9F82A333BEF
            EAD6F96DB474CD1A5AB56E3DADDFBC85366FDF41BBF6ECA17D070ED0B3CF1FA6
            175F7E995E3A72C4D7CB6C08AA575E899841D8106C3378EDF58819F886C065C3
            5FD80C6002987FF0966604D24710C90670BCC7E7254B9753765EC19E9CFCC258
            C7E0592067634CC75759397997B5CC9E438B962DA78E95AB68259BC0BA4D9BC5
            04763EBD87F6EE3F48879E3B4C2FBCF412EB65110C41F5D2918839986CE15833
            05630630022913DE3299018CE06FDA61C846A0BD02583B90959BBF3F3796099C
            F17236C6747CC506F0ABC659ADEFCD6F5F4C6D8B97D0123681156BD71913D8B6
            9D76EC7E9A4DE0009BC0F35C12BCE89B40F76610CC148EBC1A3184CE6610C90A
            A43460233019C1DFC40424236013D003F304D8043813288A650267B09C8D311D
            5F6565E77C1DA300B3172CA4D6B605B46049072D5EB19256AC594B6B376EA24D
            5BB7D17636813DFB9EA103079FA5E70EBF204600A1A3D056346330E6102C215C
            9902CCE08D37D057807E02D371A846A0C387EF7A2304CB96AF202E050E1514C7
            3A06CF54391B633ABE4A4D9FFE89F2CAAAAD2D73E751330B46D0D6C126C0802D
            E74C60CD868DB471DB36DAB66B37EDDEBB97F61F3C24FD02620487D9082CC104
            9E7FC1E8F08B2FFBB28D216C0E265BE02CC12B1F3423301D86DE7022970532C9
            880D001D857A2CE54C203BBFE05536819FF153E7DF17D3E92B67634CC757FD06
            0CFC486149E91CEC01308B3300DF04B81C685FBE92967326604608B6D1D61D3B
            69D79EBDD23978F0B9E7A42C8060086A0A2ACD12C299425766F02297105A2E88
            11786501460D64F8502613994CE0BD77DF936CA09DCD2A27BF606F5E61F1F75D
            7F5F4CA7AF9C8D311D7FE51715F79E59534B180D689A33D798009BC17C318115
            B474F51A5ABD61833F42B0433A070FD081679FA5036C04079E357299C2D11A83
            6D0E300318C12B6204989568F70F60D8D0F40D60C2104CA063B98C0EEC671388
            ED277006C9D918D3F1577159F9578A4ACBDE6C9E3D875AE6CD17033099803181
            45CB56D03236010C13EA08013A07F73CB39F9E39C826E019802D98812D3186E7
            8D9EB34C219A21BCF012FA0B4C5920FD03AFBF6EA62263B4804B02F40DC00474
            98109B8AB0093C9D5758F81DFDBB623ABDE56C8CE9C3515171695A556D9D7404
            AA01181358E899C0725ABA6AB50C13AEF54C009D834FEF7B46260DA9F61F7A36
            A0E8C6A09942F412428CE0656F78D1EB2434D980994C24F307381BC07C01F40D
            2E958EC1828385C5A5BF74FD8D319D5E7236C6F4E128BFA8E48BC5A5E5879B5A
            67D32C2E05D400D0392826D0BE38325760ED3A1921D8B8751B6DDBB98B76EDDD
            2725C1BE03070366E032858021581942384BB04D0146801B8CE0BE04C806CCB0
            A1E92434D38ADFF2D710742C5D4EB9F98547D8047EEBFA3B633A7DE46C8CE9C3
            536149E9A3E59555C600AC52008F9119CC631358B8741975702680B9026B3C13
            D8B263A74C1A423680B2008221A829B88C21AA29B88C0165C30B2F48FF801801
            860D391B800948DF804C207ACBCB04D804962DA39C82C267F9EF894D163A8DE5
            6C8CE9C3D3F2EDAB3F52545A568DFBFE4929609B000B6DC80460029830A4C384
            EBB76CA5CD6C02DBD90476B309C00854983F20EAC614A21A021B00CE3082E70E
            1FE66CE0457AD12B0BB46F40460AFE6A4A02EC68042358B4C48C0EE41715C7FA
            044E53391B63FA70C506F0EF25A565EBAAD9045AAC52C03681B98BDA6941C732
            5ABC824D009D83EB37D0BACD5B68D3B6EDD22F809240C4E0C31054B631883958
            D942D44CE160C418F61F7A4ECA82E7A593D0CC21C042251929C090A1D72F8059
            83EF70498079027985457B0B8B4B62A303A7A19C8D317DF82A292BFF6A7169D9
            8E9AFA067F6E80DB0496B209981102ED1CDCC826B075D76EDAB9672FED641310
            F16398816F0CAC68C610AD8450738011A003F1597414BEF45264C8D032019404
            B27EE03D8C0EAC409FC0336C02B1FD044E33391B633A316203F8366B576D6393
            D30466B5B5F99940FB8A95D4B18A4D602D9BC0C64DB461F356E9174036803903
            90188227DB08BA3283802158A6F00C9B01CA02318117CCFA040C19FA1D845212
            FC55D6102013E8E09225BFB0E8C5A292D23FB9FED6984E4D391B633A716203F8
            3A6B5B6D43636064C037016E9BDBBE98162C594AEDCB5650C74AD339B87AFD26
            7FD2D0D69DBB651A310443B04DE1FD9A03FA14600898967C888D40460A381B90
            92C09B450813C070214C0023044B974B39F02A9BC04F5C7F6B4CA79E9C8D319D
            587999C06E970960D210B283799C0960EAF0A2E596096CD8486BD904366EE592
            804DC0961AC2B65DC6106C633826336013406980B240460AD808900DA02478F5
            55336700F305500E40ED8B3BB81C28D85B10EB183C2DE46C8CE9C4ABA4ACFC7F
            4A241368A059A19101087D0273162E9209430B972EA7252B57FAFD02182AC43A
            82CDDB778AB6ECD81550676378DA3386A3CB1260067B3D1340DF8098C08BDE70
            E12BAFFAD3886559F1DFDFA6C54B3A28BFA0707F716C88F09497B331A693A3D2
            B2B26F969495EDAEC1E8C0BCD03C0116B28339326168092DE09ADBF40B44B281
            755BB64A07A11A81D310B6B321EC603360E179245388940FD132853DE81BE092
            C0EF1B78111D8466CE800C15BEF1A6BFAFC092A54B29BFB0706F61712C133895
            E56C8CE9E4A9B4BCFC3B9C0DEC4439E01A221413E04C601E4C009D83CB57D212
            3601AC28C450214609366CDDE60B86B069FB0E51D818C2E6D039538818831A02
            3634DD77101D84A6244007A1CC19C07A02AF5F0053876102CBD9A0D8040EF2DF
            73A1EB6F8DE9E4CBD918D3C9556979C537189A1D5D750CCE590013582CC384E8
            1758B272352D6313D092007306D66DDE2A1388541BB61943106D3799826D0C30
            81CD9C21204BD8E2650861638019986C008B940E99C9433283101D8491A142D9
            60E46D6402323AF02A97033F77FDAD319D5C391B633AF92A2D2BFF5619670275
            8D4D5D64020BC504DA96B0092C5B418B57AE121358C126B07AC326CE068C09A8
            026610254B70650A6A042AF41FEC7C7AAF0C1DA283504B02594F70E488377B50
            4DE06D3181C2A2E2BD6C02DF73FDAD319D3C391B633A35C426F03536816D3528
            071C1D837E26B0884D6071072D5CB65C4C00F305308578D5FA8D9C0D6C16C10C
            228A98423463D04C61D3B68831D8E60023D8C1268091827DFBD904FC19842809
            5E96A1C2D7B924D04CA07DC912740C1E28292D8B750C9E427236C674EA880D00
            99C0B69A7A6302B611C810219B0056126ABF401B47DB8552127036B03A920DA8
            11B80CC13683688680F2018221A839C0084C4980C94407CC50E17387B9243013
            878EBC623A07610250FBE225C804F6141597C43A064F11391B633AB5545A5AFE
            BFAC17BAEA1330C384EDC604B8244036A0A304CBD7ACA395EB37889015ACDAB0
            514C4115CD188EC61C60043A2D1925813D4AE0CF17E04C00EB07FEF6F7B76515
            614161D1819292B2F35D7F6B4C2756CEC6984E1D9594969E53565131B9AABAE6
            9DA2F20A2AADAE896A02C804E62E329D833081054B97D3226F9460199B00B201
            48CDC0370536043505DB0CBA33049800CE3082AD3B77D1F6A7391BD867F62D40
            36F02C5616BEF4925955F8DA6BF4173681BFBFF3B62C202A282A3A525256F67B
            D7DF1CD38993B331A65343E54B967CA4BCA222ABAAA6864A2BAB28ABA09032F3
            0BA8BCA6366A9F004C60B63742307F71870C15629460F1CAD59C0DAC152358BE
            767D406A0CB6391C6BA6B0DE9B88241D84325CC8D980377BD0F40BA073F055B9
            39C95B7FFFBBAC1D282C2E7E9E0D2ED6277012E56C8CE9E46BC884091FA950F8
            671AF8B30B8B446A02AE4CC0F40B2CF0B281769939D8C6268092C064036B6829
            9B008CC03603FF319B80881FAF5CCFA6C05AB90E5942F44C0106A067F41160EE
            40C4040EC92E443A5F009D83C804306B70494707151615ED2B2D2BFBAEEB3388
            E9C397B331A693AB9ADAD2732BCACBB3AA6B6BFDC8AFF0874D20DC31A826803E
            01C906162E122398D7DEE1198166036BA863F55A5A6A494DC1360655D42C8115
            C812D804B036C18C12EC312620F305B0E3D08BF4822C2D7ED56C35C646B068F1
            622A2A2EDECB99406CCBF1932067634C2757A565E559159595545431933218F4
            30FC2A98404955B50FBD6D02CD738D31201B686DC328413BCD59E495054B97D3
            42CE06DAD9086006102612213B1063409610C518BA3207640AC81A302D79FD16
            AC54DC2926B07BEF3384FB1F063A078F7026E0DD8760B16402C5FBF9EF8E9503
            2758CEC6984E8E1A9B5BCE2D2D2DCBA8ADADA7FA96569A9E9BE704DF160CA2A4
            B23A9009E0BE038DB3E79AFB0F78ED58512846C0263097CB82793252B042CA82
            452B5689DA550E53385A43B0B304CC46DCBC0325C1D3B46B4FB0731099001612
            614F0164021D1D4BA9B8B8F4F9B2B2F28B5C9F4D4C1F8E9C8D319D1C95959665
            57CCACA44D9C421F78FE05AA9F359BD273729CE0AB728A8AA54428ABAEB1E09F
            236A68356735021D2E44593047FA0750162CA7056C04C808546A086A0A726633
            5063D02C215C4284CD011901FA053054B865E72EDAB90725C133A65FE0F0F3FE
            0801F614C0DD8896F2BFA3A8A8F8D5F2D2F2D8CE422748CEC6984EACE6B7B59D
            CB177E66C5CC99B47EF3567AEEA523A2FDCF1DA6BA9659949695E3EC0700FC2A
            3501358086D6D9A27AEF6C3202AF34F0CA82D9521660DEC03231015534335085
            3305C9161CA6A0D9C1EA8D668192EE6084D9833001F40BA07310D387CDCD48DE
            92A5C4C545C57BCACACB6377253E017236C67462555854943DABB555A6D63EFB
            E2CB12FD213CDEFFEC6181382D3B476AFEB009D846905D502426A006800CA27E
            562B9B48AB9C1B66B319848C6096670473DB3B683E1B013282B6A511D9C6D09D
            39A831D8E503042358B5013B186DA54DDEEC41EC31B0EF40C4043042803D0550
            0E6074A0B8B8F899F28A8A5826F021CBD918D389D1924D9BCE29282CCC6C9935
            4BEEDDFFF6BBEF0AF8FB9F3306A02670E88597A895614DCBCA161340B40F6704
            7626505A552DE93F0C0019442D4BCF620AAD73F97536023681E6796D96112C16
            2398B778A9088630BFC33305AF54E8CE0C167A67DF14D808600AC80E56AEDB68
            860AB77BFD027B610207FD158562029C09608460517B3B4607F67126109B36FC
            21CAD918D387AFF9F3E79FC3512EADB1A949B6DCC681BBF2BFCEF530527F3500
            080600A18E4FCDCA3206C0D043D988FC962413E0F6E2CAAA08F8CD500BD534B5
            98C7C80A6004C814B864F08D804DA0D52B0B5473DBA10EB7311C63A600334049
            8039031B641B33F40BECF53B07D504E48E447FFDAB6402252525FB2B2A2A7E87
            CF2CA6E32F67634C1FBEF8C2CEAAADADA5175F7A899F92ECAC0BC1065E79FD0D
            7AE6D9E7032620E5009F01F0B4CCA009848D206002CDAD3EFCD54DCD54DDD82C
            8F6B60045C1A1823E08CC0330298C0AC058B68F6A2C59D14340618828A4D810D
            41D5B67405B5B109B42DF38C814D60C172630C8B3C1340BFC07AF40BB009C8AA
            C267F64746085E7A598C10E5008608F9B37A8D4DE0027C6E311D5F391B63FAF0
            B468C1827339F267D530FCCF1F7E9E9B22F0FB26F0DE7BF4E22BAFD233A14C40
            4C80DB0031CA812CAEF9A1EC42006F94031595504E718998018608611A6200FC
            73505563933103B4B3D04750873E033682C639F3A8C9CA06549D0D216206C610
            8C30E1C864092653B0FB14343B4036B0143B186DC03666DBCC1D8F767B938630
            42F03CEE4EF412BDF6FAEB72FF81A54B97517149C9DEF2F2F2D88CC1E32C6763
            4C1F9E8A8A8AB2EB1B1AE830A7BB387CF0DF89486FBDF53C47C2703900134076
            50D5D0644C00D15FE419809F05B009B0D404D400F07395A2463957C114F01A67
            099A11A07F0046D03CDF188166052ADB183A9B43D818D8103C49E9E069016709
            4B56AFA595EBBD9D8D3185583B07B115B9650228076474A0A4E4006702B1C942
            C751CEC6988EBFD6AC59736E61616166734B0BBDC2D11D870D7D50EFD0BBEFBD
            2BBBE93CC710201380114080FFE0E117691F9FEBB8964FF54D20027EB60F7F30
            13800108FCF50C3F6B667D83790C236850234069309B338239D259D838B74D32
            82E6F90BD808A0A019840D216806E1B281A56736044C4D5EBC0AB743DF406BBC
            3B1EA173103307FD1182175F942DC6B0F5383A06B91CD8C399406C88F038C9D9
            18D3F15761614166535313BDE675F8D9B0DBD2FDF52164025839B79FA3E1BE43
            CF09FCAA036C066A021822D40C2092091813B05534B38AA107F8ACBA06AA10D5
            8B115478A6502925028CA0956A24236023983D4F8C40D5346F8108A6A0EA3653
            58649BC312919995B8544A020C15AE963B21B309ECDC6D660E1E384007F96FC4
            3021B618C384A1F6C58B314478A0A2BCFC97FAD9C6F4FEE56C8CE9F869DBB66D
            E714161464D431682F1F39C24D803F3AF401BD8D4CE03D7A8353601880ADBD2C
            740AEE3DF8AC2C0A4239A0A580191234D0E77AD24CA0B0A252E087CA6BEBA982
            555E53671EA35D3302CE06A06A36811AC908D051389F1A66CFE7F2808D00F20D
            4115368405D10D810533C079EEE20E192DC0E421992FE0770EEE911102AC2130
            9980B913113281E2A2A257CACACA62D3863FA09C8D311D1F3DFFDC73E770DA9F
            55595945CF1F3ECC4DE4063D2C065FA5F7DE7BE5B537680FC30EE06DA12CD8B1
            779FA4F8E939B90279A70C80E1CF2D2E15E17951F94C03BE077F5940DC86CC00
            5902CA8526CE08D808900DD4725950377BAE6404B6C418441153089B839D2574
            CA14582811D041684CC0DCE3009D8330016C372626C099C02B9C4161EB712F13
            385C1ADB4FE003C9D918D3F1517E7E7E560D47E7E7B896C5D115E836F02EBDF3
            EE3BF4E29157E869AE8D157E18C21E7E0E13D8F6F45E593D182E070246C03246
            50229980C25F0A55D71A55B1D804CAD81CCA6A394BA86BA40A1801970555184E
            C41C0236815A16CEC6108CF0181942BD271882CB18D41082D982999188D102CC
            1E5C21EB0836CBA421993EEC0F13BEE0EF2EB478C9122A282878A6A4A424B6DB
            F0FB94B331A60FA695ED8BCE65F8B3EBEAEBE98517CD38FFFB81BEB3DEA14387
            5FA4DDFB0F0AF83003113F477FC066AE9D4B38DB988E4C202AFCC6009015C004
            C4003CF84BAA6A8CF0186D300836013102CE082A1A9A39238011B47269309BCD
            608E6405263330D981AD63CE12B88440468051029934B4CEDC0EDD3601EC3284
            DD8765D761CE04162C5A449C65EDE14C20B69FC0FB90B331A60FA63C86BFA1A1
            41B6C0C21184FDE880C7069A467FF7F536B7BFF5D6DFA40F6037A7C5001F6680
            C710DA9109C004D273F2DCE500649503055C0E942AF8AC622E258CF058CD0059
            829711D4377169C046201941AB2F630846B5ADD0B11A83110C0159014609B054
            D9EF1CC408019B006E4A8261424C184226803E81B6050B28BFA0E0009B406CED
            C031CAD918D3FBD3FC850BCFCDCDCB9D51535B47AFBCF20A3711C3ACD01F05F8
            3EF441F06DBDFDCEDB325FFEE903076997073E84C7103A079109E49757D08CDC
            7C190AB405F8559A11E4B30944C0AFA6A299509539E339CC804B031801FA08CA
            B82C10236013A86C9AE52B6C0811539843356C0690F623B8CCA07E8E3104940F
            4D7317987E81A52B658521FA0574F35198C033FCF7231378E575731312980097
            03CF159794C46E43760C7236C6F4FE94979F97555955259D55389C90AB18F220
            F0D1A1C750E05B7F5399FBEEE1869C3BF7EDF7C1DF85C72CB4C104D09B9E5958
            44197905261310210388806F2BBFACC202BF8ACB03A8D23BB3C40C6AA8085982
            F6136024413A0B5BC40C6C75650C9A29986CC12E2382994213670358A0844943
            6202EBB1A2D08C10984CE0A06C3A8ACF02EB07DA162EE44C20FFB5E2E2E29FEA
            771253D77236C6746C5ABE60C13979797999151533E9D0B3CF725314F88F157A
            C8833E2CFCBEE75F7C99B6EFD9E7830FEDD8FB8C081D84E851870160D720A4FB
            3081700620E79232969A4004FE82724B788ED77C23A8A562CE084AD8084A6104
            0D4D22F4135434361F9519A82144B205CE12BC7E0531013E37CC9DEF750EAEF0
            3B07B11D39F61CC44222AC26C4AC41945B9A097009B6B7A8B030B68AF028E46C
            8CE9D894939B6B223F47231C0A7A67D8A3030FD9513E9AB087DE5FDFD2E77FA7
            679E7B5E4C40C1DFB1C7133F46FF40FBB29594995F4899055832EC95015629E0
            6701620265620206FA99A2FC32A882F270F6CC209F0DA2808DA0908D002A6613
            28A96D602368A432CE085428137C5360D9A6103686B039D8C6003340E7E0BC8E
            A5845B9F453A0777F2DFBA87F6E2FE84CF3D271B8B201358B8A89D72F3F29E29
            2A2E8E0D11762367634C47A7BF1CDCF791EC9C9C4CD4FCB83B2E0E033D803E16
            E0A3832FC0430C3DF4175F6FC9EBD85873EF8143B4F5E9BD023ECCC0164C60F1
            8A559205641614FA2660F707E4161BF8E5CCCA830928F8A5AA7273E6F63C9800
            CC4132033603CE06FC8CC0338212CE0AE4311B0154E69981088FA50F01A61031
            063182C659FC1886D0EAC91803B28226740E62D290377310D387C5043061E800
            E60A3C4B2FBDFA0ABDF6FA9B34AFAD8D727373F7151516C51610752167634CDD
            AB7DD1A273B273B2D331CEFFF2CB66869F0B725577B0FBA0431EECB6007C400C
            3E84BDF45E79FD75817D1BA7C4726633B0853E82F98B974AA76016E60758F0DB
            F28D8025C05B06905B522ECAC119CF2198018C824D209F33820294066C02C808
            543001158CC1969F2948966032053B430818030BE541E33C740E76789386D804
            36620DC10EDAEE6D418E9B94CAEDC8F833993B7F3E6702B9FB0A0B0B7FA5DF5B
            4C41391B63EA5E1C5DB2B087DF61AFC3CF07DD093B140576A83BD82DE06D6195
            1C84DF8945435B76ED11E0B7EEDE1310DAD03F80ADC1A7CBC800FA023A970362
            029E011813B0C12FE3D7CB289B85B33C6793F00DC1CB0C501AC0080A9115B019
            D8729942D81802E5034BCB0731870633F4D83807FD02A67310FD1C18265C8F35
            04BBB0DFA09930847B0FA809E4E4E4BC565454F81BFDEE628AC8D9185374D537
            CE3D37272737B3B4B48C9EF566F8053BEC6C75013DF43EC057E8C3C27BF71E3C
            244380610350213BC0FA7FCC1110F01D9940C00020861C06A0E067F37BB28A4A
            D93C58780E731003302690CB2690676504300255D8085C86609B81D314385340
            368061C3D60591CE415943B0659BDCA8144B8AC504E49E84AFD39C796C02B9B9
            FBF3F2F263E54048CEC698A22B2F3737BB98A3E7FA4D5B640B2FD4F9EF0FF6E8
            697D97B0FF25A237447FF176D4FDABCC8C43E71F4C00D9C0168E889B77AA600C
            7B69D38E5DB20E60BA4C14B2B20006DA3701CB08F21870640288F8005F545842
            992C7D1E3402AF8F404DC0831F66A0B24DC1368663318772CE08B47310330771
            03542C2B8609E0D6646A022F8909BCC199401B32818305F9F9B18E414BCEC698
            3A6BC1EAA5E770DA9F5952524A6B39E5DCF72CA6A3BE26C3711F3AF851A00F0B
            BF0B173C80DFB463B70FBE2D64021BB8662EAFADF3CA01AF5350A60777CE0634
            0B8010FD01BEAF8262963102C91042E5808C168480B78D4065BF7EB46600C104
            D02F2033071777D0A2152B65BB312C24D2B902CF1C3824FB0C6288701E9B4056
            76F6DEBCFCFCD87E029E9C8D317516E02F6600D66EDC2CEBF17770AD79F0B9C3
            52F7BB40C77E76D031811E82DD00EF865DF4E65F64EFBC88DE94DF8B7BF06DDC
            BE4B80871118EDF2B453320344CAE29955D23118065FE10F0B2620D15FC02FA6
            8C7CDC9908E2E785C5620439C55EBF809880E9202CC06C42C06D81EED2FB3106
            640330012C459ED3BE84162E332680DD87716BB29D5CF660AE006E4272E4B5D7
            68F6DCF93081FDF90505BF707DCF679B9C8D3145B463C74B1FC9CECEC92C2A2E
            967BDE61D18DCEBEC3145C80879EF8A8E087A0873E28F841E80DF8A23770C67B
            FE4A7BF61F92482FD0B31900FC8D0C04B481B58533016CC705A833F20B23E540
            C0084CDD1F3101069B9F03FE190CBE5121CDC8332690E19900B201CD04305498
            8F09445518213026F07ECCC0164C20F2DE3A3101EC5BD08099838B168B092C5B
            6B8609B1A458761E661378F108EE4EFC1ACD9A3D9B32B3B28FE4E7E5FFC1F59D
            9F4D7236C664B470D1A273B2B2B2B30A8B00FF26DA7B28023F66DFA1DE7EE995
            57A503301AEC50F7B077017C57B07BC2461911BD216DE801DFC690AF6713B0C1
            17711BDA37732680A134F4016432CC41F8D11760C36FA49D82807F7A6E214DCF
            63E516503A0B669081EC80B304BF2428AB30F30566220BA891B9022A31045B0C
            F4FB3107B46146223A07B196002620C3846BD6CADD8AB19A1073059009C83D09
            D9045AE7CC25FE6E9FCFCBCBFBA1EBBB3F5BE46C8CC928233333ABB4BC9CB6ED
            DA25F3EBC3536EB73DBD8F0E3EFF02D7FF6C0047097C97B0B35E87A280AEB0EB
            19B0AB50E3DA827160EDFCBAADDB05F60D0C01CEA2AD46786DF3AE3DB26127FA
            033047C0EE0CF44D206404E818C4793A9B405A8E813F1D67160C01E60023C842
            56819F292B97720053896102253598421C946D0C620E0CB5A81B63B08D009901
            E60D605111761AC2DE021D6C026635E10EDAF9B4993A8C3E8157D8045A381398
            9191F14C4E6EEE59BB94D8D978B66BF1BCC5E766CCC8C84687DFA1679FE308FF
            76609EBD6A3B1B0096E4BEF917069F3380F7053E831A8CF20CB8057E30BAABDC
            D047F4BA08EF8569ADD9BCAD13F8A22D46EBB7ED94F5F8190CAF406B19808CF7
            5B3259809709B0A6E7158809A4E5E41B65E77BD9806702FC3B8C09E83C812A2A
            6613C05E032E23803A99C1316409E817D04C60960C132EA325ABD7D02A2E77B0
            A458B719935B9473F6864C80CB81BD39D9B967E5A622CEC6B35DE9D367649557
            54D0C1679F95A13EC00CD011F175AEBD4EB5C5249B175F7945EA7E0379D7A047
            600F82DE1DECAF75013A660262BC3B2CBC07E9EE96DD4FD35A3601057EED966D
            01A10D9D86B86FA03F32609B00CBCE00545A0E00F8D4EC3CA32C738629201BD0
            9240CCA394CB01AC30840930CCA5B5F5460CBD2D97294047630C30012D07CC5C
            8145B2FBB0992B604C009B8B609B31D967903F23CC13E04CE0606E6EEE59B79F
            80B3F16CD58285F3CE4D4B9F9E56565E41CF1D3E2C1B72BEC9293D36E1D8CF99
            C0B6DDC179F61086D5F01A52FFAEA08FC07F34D04311F083F01BE8BB02FF888A
            E1C7BC78ECAF0FC8D784C017B131A839E03936059D214B88ADB90172361D8291
            4E41033F84B634867E5A56AE2825D39C6104E9B928096002FC3BD404381328AC
            AC16A8B1F5986F04C7CB0C58F85D55C8042C13E8E04C007D39C604CCD4617C36
            2FB18137B5CCA21933320E65E7E49C55B72173369EAD4A9F3E9DCBE06249FBDF
            11F84D2A8F613E4CB5D5B9F5B66000D894F335065B527D1F742BCA7BD0BB4187
            8E127607F036EC2EBDEC2D93C582A1D59BB6FAC0AFD9BC55B47AD3165F685FB5
            71B3EC0B888E3DC08F4CC0CF061860BB14107116804C0026909A954FC9193080
            1C5172460E1B01B2817CAF83D064166A02D86C04E580D97FB0B33E9831C0041A
            A8BAA995CB0163020B962EF7A70E8B09C886A3C604500EB4B4B6C2045ECFC9C9
            39CF757D9C8972369E6D5ABA6CE3391CF9338BB8E6DFC7F5E13BEF32FC0CB30A
            C37B2F1D7955600FC30F615CFD85978F8859BCFE4630BD77030F05A177817F34
            11DE2540EF8B2FEC97BD76FC3B576ED84CAB3747A0B705F8D137B074CD3A011B
            63FC6A0276062026C0673B0BC0CA41BC0FD13F39235BE09F3A235B8436988029
            098A64A8504607B81C800960A721EC440CB98C40F57E0C01BB17E11E078D73E7
            CB5A8885DEFA81356C029BB699D101E9139021C257A99933012E01F76665669F
            15FB09381BCF266DDBB6FD2369E9E9D9058545B4FFE0411F7E3B95C7FDE90091
            021F1626DA60975ED4FF5141EF26C20BF016E4470FBB053C60F784E149A35744
            B8B83141680DC30FD0576F64E859781C163A0DB1D04627FD481680F17D2D09C2
            59004C0099401926019549F49F3A234BE09F323D4B84365312980E423101FE99
            FC8A996202A535B5BE09B8E432045577C6809D8BB0AD7913D7FA73659EC00AB3
            9C98FF5698808E0E68C760CBAC563681E9CF6466679DF1D3869D8D6793D2D2D2
            659C7F2FA782D87F3F5CBB2395C71900EFE09A1F73EC0DF89179F6E840C38800
            A046E4774575DCE3EE83C06E40C7630B74EFB1C28E65B038A3535274C4126728
            F83D4F3F738056ACDFE8C38E8C6025CEFA986BE415EB378909609E3D52778C0C
            443201D321182E098C21C0042A243B400630393DD333009C33253398E69900B2
            0B35810231812A01B642EE52C4D07B67FF79C00CF8AC0A99831A81FFDC33026C
            5D867B1FB67826B0484C60AD4CEB363306BD21422F131013489FBE2F2B33EB8C
            1E1D70369E0DAA9FD370EEB4D4D4E925A5A574F0D0B3F4F63B11F82343721121
            BA63242032C73E38CF1EB3ED9EE75A12EF8D44F8509467B8A1CEE033D82A0F78
            1B7A91001E5124C2430CBE0DBBE88811830FA144D1D7301108901BE00DF40ABE
            D14611CA02DC1A0CFD012603F0C0F785E7467E260013E01ADF9840B698806A12
            0B59013A08D3C404CC5C01318172B33129B62937B72A8B2EDB0CC252F0C38229
            8809CC9A4DCDF3DAAC4C804D003306B7732680DD85F83B469F00BEA7D6397388
            B3C37D19995967ECADC99D8D6783A64D4BCB44871F86FA007F107853BFDB353C
            0C00BDFD9851E7436FCDB3DFB06DA774B4BDC13F1B0D74A363833D083A8B0156
            75057B588739BD85F0FE03CF3E6F811E015EB57C9D91BE86482B23030CBD9601
            9192C03301CD021866ED13408407F813D33268124BCFC80AC404A47310998067
            021595D22988854A331BB0D9A811A087291C0F63C01D8F6A39BAAB09F899809A
            803763109F15BE97A696164A4D4B7F3D3333FB8C9C36EC6C3C9335BBAD15913F
            2BBFA088D3FE67E8EFEFBE1381DE01BED6EFC80E9E7BE125DA280B6A22E04332
            CD96A32ACA0237F4EE281F0DFAAEC08F407F34E01BE8C3C2CFA21373D99AF54E
            F097AFDBE00BEDD891179B84CEC8C39A0107FC9E3403B03301C02D26903AC3D7
            0416DA5026A4669BCE412C2642168172A0A4AA4A962CCB2DCC1B71AFC28819A8
            117C1033A8A86F924C60D67C3681763681E52B68F99A75B4CE33815D5E2680CF
            F4087FF64DCD6202076664649C711D83CEC63359D3A6A54A871FF695FFFB3B0C
            7F00F608F02A4DE5610E0007911FF3E9757EBDCEB15FEF9DD1D1869F3B1EB047
            80F740B760EF0CBC1B76942561493B3A04376DA5656B23B0E3F1B2B5EB035A2A
            26B149E6D623F2A317DFEE14741981C8CB08600278CFA4F40C1A9F924E13A64D
            A7F150CA749A949A41C95E49807E017438E69696512197032555D55451574755
            0D0D54C526604B8CC1939D291CAD41C004B017615D2B4C6001CD5BDC41EDCB57
            C92AC2F59BB7D0961D3BC504F61D38C09FF3CB326DB879D62C4A9996CA269079
            464D1672369E896A9D5D7F4ECAB46999B979F9B4671F477E4EFBA3410F05EB78
            B4BD29406FC5525A8EF60ABE2EAE81D66EDD467BD8585EE59FEF043E837DB4D0
            1BF03B03EF82DE0D7E67E86D2193418F37FEAD4B43C02BF411ADA30ED632CE04
            E6B47708CC181D10F8C508AC6DC22CF0C39900DE3F316D068D4B4E17F86106D0
            246E9B32C39404E9DE7A046402859209B009703900E8AB4326A0FA206650D9D8
            44F5AD73A8B56D01CD671358BC6225AD5CE799007FAFBBB19FC0C143FC7D60ED
            C0ABD4D8DC4C9C3DEE4D9F3EFD8CD94FC0D978268ADD3B2BBFB090E1DF4F7F7B
            FB9D2E61D70EBB701A8FD7301280B1725D5167CFB15FBB65BB18840FBF0B74A8
            13EC1EF01EE45DC10E70C3B077053C3292B0B048084267D7E69DBB68C9AAB53E
            EC2A400F2D591DD1322E0FB01F5FA453504D204A1600A921A80970FA3F666A2A
            8D4B49A3B1C946C80A304A90E26702456C02A51113A8ABA7EAA626238656E532
            04956D0C9DCC81E157C1041A66B3092C58406D4B4226C09F8D31019403A64F00
            A303D352D3F6A74F9FF173D77576BAC9D9782669D5EA351F999A9C9269D2FE03
            B2B0C70D3D4B200F426F0FCD210B40D4C4B4591B7C5960C36D30064CA70564C8
            1682E05BD07B800BF816E441E823C047A067D85F74A7F54105617FEE052802FE
            B3CFBF408758CF1E7E516EAA813BEE2C5EB5C600EF6931032F627358BC3A2218
            01EE0A84BADD3701191D30D26CC02C0756994D424C9F40A99400A3A74CA3B153
            D3C40C20B4C104A665E51813D04C80CB01DCBBB09261AD6103808ED50C20E94B
            F01430035655533335CC996B3281254BC40456AC5B47EBB76CA1AD3BB91CD8BB
            574A467C1FAFF3B5D3DCDA4A7C4DBDC4267091EB9A3B9DE46C3C5354DBDA7E2E
            7F515948FBF7EDDF2FF0478037B087810F436F0B3F77E0B9E725D28757D4E9DC
            FAD59BB7D25E8E18E8EDEF1CE50DF0AA08EC9E02B05B62A8552ED86DE06DF0C3
            02F446877DE1BDBBF63E23A0036E1F7680CF6A6763F0B5728DBC67C1B29572DF
            00E90FF04C00604B36E0C1EF9705027FC408B08D386AFD711CF9610263A6A4CA
            191AC725013A0731692860029C099455B30934B009701A2EF2CCA09329A88EC2
            18EC0CA15A4C600ECD59B488DA97AFA015EBD7D386AD5B69FBEEDDDEADC90FF1
            E7F53C7F97669E4003FF3F5252520FA7A5CF38ADF71370369E294A4E4ECECECB
            2FA0A7F7ED934D3B14763BBDF761B73AEC6CA17EC7172ECFF97DA89F15F68030
            C79ECFE858431980F4DF879D2F9A20EC5E64E7F3E1709467A8DD515E41378F9F
            B3A07F9623BC1BF6C37EB4C7E383013D6FF41CBF87DF8F75010B57AE0EC01ED6
            A215AB454B56AD934D37B0CACFACFBD74C404DA0F3F0A0FF9C854C007023FD1F
            392985464F9E46A326A788D0867E01CC2148CBC993DD8AD0F9081328ADAEA699
            5C0ED4B20184E51B838A010D1884660BD6639800CEB52D2DBE66D6D571D6C199
            0A678CB8B37241691915F3F31A7E6F7BC752DAF5F4D3D2718CEB096B07A64C4D
            E67260FA0F5CD7DFE92067E3E9AEB2F2D2739353A671E4CF93197EF8B214F820
            F8803A02BB2DD37917ECB8433B0046FD0F607CF03DA10DB3EBB0473D8046C40F
            82CF52D06D31F0D153FB2811DE013D644777950F3DC37E9033186431BE9E7D9E
            DFF302EDDCF70C2D62035814057A0877E451214BC0ADBC656EBFD72918C9026C
            596581570A40D81F00E681F47FC4C4641AC5460033183529994B83549A943A43
            A613A765E7CA6C44E91360104BABAA2513A86D667019F4688A660462069E007C
            DDAC59F27B274D4BA5210989F4D48081D4B35F7F7AA24F5F7AA2771FEAC17AFC
            A9DEF21CED8386C753666E1EAD5CB346AE0F2C25E66B6DCFB46969A7E596E3CE
            C6D35D18E7E7FA8C366DDD466FBDFD8E073C83DD25EC2C0B76BF6EB7A4536DB7
            ECDA4D5859E75A512773E9F90CF090FA7F50D89FF5C58087A03F74B833EC901F
            E119705504F8E7644293AF43E68C9F598B2C60F92A27F0227ECD164A849AE656
            7FBA300C40B301FFB16700BE2C13C0B461641148FF93264C6503486633982A42
            693031753A9B4026A5B2092013C076E5053001CE042A1BEAA9AEA5B9935C6660
            0B0600F01B67CFE6B2A29AC64C9E2C60037205FF81C77AD06DF73E4037DD750F
            DDCCBAF5DEFBE99E871FA5477BF692D71F79B2A768C2D464EAE0720199405A7A
            FAC1E49494D36E88D0D978BAAAB2A4FE5CAECBD2A6CFC8A0B6C54B189897A4E3
            CE05BE015E65431F029F21B685F7612400A0DBE08BBC0536983C837DE9030620
            D0BBC1B7810F42CFB280F7A18F0ABE1BF84ED04300FFD0B3A2670EF299DB30F9
            650947F605CB5746051FAF19ADA0052BCC63ACE6D3053E814CC061000A7FC404
            664A39309AD3FFC4F15368041B41D28429620868D31102EC37809B9C6A395056
            53CDE97B03D5CF4214EF6C04AAB001D473C46F6060A7E7E4529F418319FCA7A8
            57FFFEF458AFA7E8B6FB1EA0CBAFBF897E77E99FE9820B2FA15FFCE14F74C145
            97D2AF2FBE9C2EBCFC6AFAF30D378B3100FE9EFDFAC919C6919E954515955558
            4A7C803381D3EA0E44CEC6D355535352B2D367CCA0054B3A64C3CB7D070F49C7
            5DD7B05BC05BA0FB9D76189EB36A78FC2C16D460EE7CB415752BF835CC10448D
            DF19F62E803F1C01BE5BD08F0576486157F16703E13352E167312CD8B66C8503
            7823BC265A6AB480DF3377F15249F101B2467EA320FCB6821D83A64F001940C2
            B8C96200300308FD02E3A7A58B092013D072A0884DA0A2BA866A1A1AA9814D40
            05435085CDA07176AB98C0984993057C447CA4F8D7DC7207FDEAE2CBE867BFB9
            887EF6DB8BE87C06FF977F04F857D06F2FF933FDFED22BE90F975D25BAF0F2AB
            E8D26B6EA01BEEB88B1E7AA2273DE91941DC889154505C8C9D85DE48494D3D6D
            86089D8DA79B1AE6CE3F67EAD4E4CC0C76E2454B97CBBA77F4D0EFE188F6EA6B
            6F30DC06FC4ED13D04BD0D3ED6878BFCDADD08BF0300ADDA10845E85C5359839
            B78A8D01B09A31FA20ECCF31E83EF8188A13E0197CEDA10F808F1ABD33F4079F
            63D85DE00374FBB102AF0A41AFC2B6D946876432D07CFE1C0DF480DC83DE027F
            BEAA83DFB76C25D5B5CE952C406E18A206C0D1DA640380DE950D781941B1C904
            D09F80F43F7EEC243102158C019386C404B2BC72002630934DA0864DA0316802
            2E336862F89131248C1E23A9FC530306D07D8F3E2670FFF4D717D279BFBB58A2
            3E8CE0377FBA5CB200BC86C87FD115D7D0C5575E4B7FBAFA7ABAE4EA1BC40070
            BEE2865BE8EE871E1123C1EF1C1C1F4F19D9D9343D2363176702FFE5BA564F35
            391B4F27E5E6179C333539391BF077AC5C23FBDD9B4939DB64DF7ED4FF02BE05
            7918768DF29D87E6423DF42CBC074022E507E8EED5749B646AED9EFD07E4676C
            D88F26CA478DF01EEC3EE0B65CB0B3BA86DD08FF4E155EC74D3661000A7B0078
            6E87E62D09AA6DE94A2AAF6B94F901A63FC0BE7558E41CDD08CC642198481247
            FEE163268A11A88C09A4D194F40C36811CBF4F4032819A5AAA151398458DAD5C
            DF7B522300FCB54D8D342C69A407FF40BAF59EFB25C53F8F23FE2F25CD0F82FF
            078EF400FF8F0CFE25575F27D05F76ED8D74F975377129700B5D79E3AD7415EB
            BA5BEFA07B1F799C9EECDB4FCA81BE5C56A47116CA9968DBB871E33FEABA664F
            25391B4F27619C1F1D7E98BC812DAE755C1E9D733BF73E23F5BE1BFA709437C3
            720A7C187CE8793D33CCF8FDF68AB9B01045311C88DADF86FD59406E418FCE37
            4479819DCF11D08DF6FB0A82BEFF5903B80D7D77A08B382BB281879E869ED92F
            A50DCE780FFEB6B94B96F9D0CFE3482FB2A09FBB7899A7A5FC7C99A8A8B2C6EB
            14F4B2004B76FF00B2031D163446606E408A4C002690387E32C58D9EE01B0032
            018C1060FE8031019309E4712650CC99C0CC5A3681A606067F1635B170366AA1
            D9F3E7D1A469D32455EF3D7020DD74D7BD1CF1FF2806F02B4EF57DF02F33E05F
            78C5D512F103E05F1F01FFEA9B6FA36B6EBE5DE0BFE1F6BBE88EFB1FA47B1F7D
            9C9EE8D38F1E6313181C9FC0A54026A5A5A58F745DB3A7929C8DA783CA1A2B10
            F9A7A7A6A5D3FCF60EDAB493D3FED0841C74D6A1FE17E05F86C2513E08BD0DBB
            D14BA2701D8FCE3CCC04D4D572B674451DA6D662F71D81DF83DD86DE0CCB39A2
            BC0FBE1DDD23E02BECBE0E06C17701AFEA04BE401FD1EE7D46788CFDF2B000C8
            06DE05BE2DBC86ADB891D66BA760C00000BE9C19F870FF006700E6EC95036202
            C14C205C0E608810D386F34BCBA8A4B2CA338146811E2600CD9A37974AD82090
            A643B7DFF7005D801A9FA33EC0FFED255708F89AEA23E2FFE9AA08F85730F857
            32F857DD742B43AFE0DF49D7DF7617DD78C7DD74D39DF7D0DD0F3E42F73EFC18
            DDFF680F7A924DE0F1DE7D68F484893081B75252537FE2BA7E4F15391B4F074D
            9E32356B5A5A1ACD5DD4CEF0EFF6C1176D6603E0141D17316AFF703ADF197603
            BA1BF648FDAEC2CF6CE1FFA75949A7D0E3B1915950B38E1FAF172891F6EB187C
            007617F002FB734ED0555161B7800FC31E001E907BB01B3DE30BB30221BC1FC3
            8273DA01B71B78BC66D4E16BDE92A5543F5BFB03CC96E050C00CBC0C409F1B13
            40061011CA01F409A01CB033010899806F023979326927AFAC8C8A2B2B65224F
            5D731335CF9E452D73668B12468F925EFEFB394AA347FF577FBCCC74EE79111F
            E0FFE9CAEBE89200F8374BAFFFD502FEED74ED2D7730F40AFE3D0CFEBD74CBDD
            F74929010378E4895E743F97020F3FD153860A7BF51F40D3D2D329352D6DAEEB
            FA3D55E46C3C9555585078EEE4295324ED9FB76889ACCFB7C1F727E4B00160EB
            2E74F4B9A33B74F4D0DBC2CF22BB4094B7A10F0B436ADB9FDE2B5940007E0F7A
            57A48F06BD0FFE816303DF87BE0BF07759E0433BF7EE93B6ED7BF6726DBF5CC0
            0E821F011E37E4C4AC405B788FF607603B7008A0FB9D8301F0A34B4CC0CB04E2
            46BB3281344A9E9149E99E092013286513A86413A86F69A6D96DF328BFA444E0
            478D8E280EF86DF02FFE3352FDEB03E05FE1837F9B801F89F898171001FFF6FB
            1EA43B58F7B001F478AA2F3DDAB3373DF4F893D4A3775F2905468C198B2CE09D
            E4E4945FBBAEE55341CEC6535993264FC9499F9141EDCB564AE4D7C93810A2BE
            0A7BDC613400E97F77B07705BC76D8D9C2345C80838D3214F6C8F2D9C8AA3A4C
            9459BF6DBBA4FDAE281F48E9C3B033E8AAA386DD063E007A04781B7680EE8B0D
            0DDAC1D0ABF09E95EB37502B1BAD1DE967F37323037CEBC2CE4229805D7F2513
            08811F4D514D8033016302769F00670213A7D28469E934757A963101AF1C28E5
            72A0BABE8E9A380B881F398AC17C8A1E7CBC8740FFFBCB3CF051E373C4BFE49A
            EBAD886F52FDAB6F8A807FC3ED77D38D9CE6037C407FDB3D0F08F477DEFF9044
            FE7B1E7A94EE7DE43131985EFD06D2E3BD7A8B340B989A9A4A69E9D3A7BAAEE5
            5341CEC6535115F50DE74C9C34390B3DAC0B972DA70DDB7739C1176D6403D8B0
            5936EF40FAFF7EA27C187A1DAA03CCCFF1190062471D1B7A7F09ADA7763600F4
            0B1C53948F06BD073E8636BB023F2AF42EF01DD0EFE08C0542F9842DB3B7EEDA
            4DF33B960580EF12FC85ED22BC1FB7E7CA2CC0262228059009A01C402660860A
            3533302A3392F20067233181B20A4ACF2FA4C4719DCB0164026202DEB4619800
            E6EFA33FA0B0AC947A7ABDF38018BDFB174BAA8FE13C033E7AF551E35F8DCEBD
            10F837718D7F0BC0E7887F1BC31F04FF11BA0F753FA7FD0F70EDDFB3EF00EA3F
            78A898C0939C01E8A8C0D88993B07C787BCAB4D44FBAAEEB932D67E3A9288EFC
            992929D3086BB63770DA1F063E3C210793716000875F3A22C0BB20577505BB2D
            D371671E035EA4FEC8027CE8571B8557D4ED6630017F18784DE90DF021E87DD8
            83C0FB111EB03B80B7617745F800F01EEC001DC2DD7270DB2C0843811076CBC5
            726144F4AE80C7EBB65ADA168949CC6C68A6E90C6F86CC0F30FD01C6042C23F0
            244660F50F007E35821CC9048A1D7D02667460C2B434CE04500EB0097039802C
            604A5A1A3DFC644F290110E1D1C1171ECEC350DE3501F04DE75E047C8EF8F706
            23BE82FFE0634F48CAFF708F27A9F78041346478020D18328CFAF2E327FB9A49
            4683E2862303C0A2A19FB9AEEB932D67E3A9A4792B567E8423FF8CA9C9295CD3
            2D90ADB7300FDF408FFDEDAD49389EF078395FB4E81F408F7D1072033D00F781
            57C8BDC7DA437F486B76EFB976DCE1759CF1FF5ABC7A0DCB5A3BCFB257D42D5C
            B19A36F3BF0325800FBC74E00581C73E037B0E30E410A0F7414784B7A0F7A2BA
            89EC0CFC5E08353B4BA1B7610F41AED15D24C01BE8B759D023EA6308732B1BA8
            9C59E80B6859B08861B7A00F83DFD64ECD6D0B7DC104D05E38B3DAEB0FF00C40
            8D40C0F79EAB01D80A650362025C52844D408708C504381348CFCEE3DABF9412
            478F95CEB9FB38425F766D64384F7AF501BE74EEDD2E9D7B374AC4BF47C0478D
            8F29BFA8F115FC7B013E438F9E7E05FF91277AD2A34FF6A2C7B8C4E8C7D11FE5
            C6D0F8041A346C38F51D38580CA0DF90A194367D064D494E79D8757D9F6C391B
            4F151595949ECBF0E7A4A4A4CA660DB88BAD6BEA6D787B6B08BBD760BB2E44FF
            08FC7674B7C007E02A006EC11E1047719D8883F7C088B082CE05BE0AD369576D
            D822D1DF86DE00CFB2A37B97113ED84B6F04E883C007A137E0FBC07BD06F1385
            A157F077CB084744BBE4FD305A053A2CB4433EFCF323427BC3DCF90234EE1188
            DB83211B908CC057240B084BE0C7D953C0044243845851887220994D60466EBE
            ACDC43F4BFEBC18739E2DF28BDFA36F81AF1157C8DF8B76BC47FE06113F1B9C6
            C70842187CD4FA3D7AF5A11E4FF5A1C171F13472EC783181E189496202E807C0
            C4A0E469A9D8406488EB1A3FD972369E2A1A3F6162CEB4B4744EFB97CAB87B34
            E02333F0AC89389C9EE39EF812ED8F15760BF448EDCE69BB25FC1CA61B63B18C
            0D3C64AFA6C334599408805BC0B781B76017E0DF07EC41E043B0B30CEC41E0BB
            821D42C662B4D313DA77535BC7726A02D49C09D891DE06BE69FE025F8DF38C9A
            D90470DFFEE90CEE0CE90F889840A43460E06DF9D0470C20D3EB278009CC700E
            119AD101AC22C4E8406F8EC28FB201DCC13023DDB76B7CBF57FF4E0F7C447C0F
            FCBB187C89F89CEA3F1000BF57047C861EB57ECF3EFDA817A7FBF1492369FC24
            36A1B1E368C4A83114C7268079074F0D1C48939393B164F8949C14E46C3CD9CA
            2C283C77FCF8095929A96901F88F067CD5D2B56C00FC73D80ECB057DB7E07B3D
            F536F4AA7D870EC9FB37311C48F15DE0AB309F1E67008AFDE6715BEAA307DF40
            DF1DF8D1A18F80AFA97C67F00DF411F00DF49B387BB285D756F2E70A03B081B7
            1506BF715E9B2FFC5C316E3A9A5714C8000246205203F08C41C0F70CC12F07BC
            4CC037013B13C03C81141922ECD96F808C00006AF4EEDBE063028F3F9C27E03F
            2CE04BAFFEC38F0AF85816FC10D7F726E23F458FF734115FC17F8A7F7F9FFE03
            A5E61F3D6E02A7F9D368FCC4C93476FC044A1A35DA18C080813471CA144A4E4E
            19EFBAD64FB69C8D275BE3274ECA4EE67A6E3EC3BF6EEB0E07F041E823937122
            1372D02B8F2138A4FD4EE015740B7617F0A8D703E2341EC27B019473DD3C64AD
            A6C3745A9811320003BC017D37430E1D0DF0D1600F026FC36E40973A3E04FA16
            44F42E60DFC8FF56D506FE0C559B38A39ABF78996C04E28AF43EF0FCBAAA2124
            6C042226C09980516713308F4BCD73CB006C2123C0AC41F42D741E22E44C6062
            B218C0633D7B09D8D732FC37DD79B719CE9354FF7ED3B9C775FEDD5C2244223E
            D7F88F3E211D7B00FF31051F111F437B1CED7BF7F7C01F38486AFD4143E3682A
            A7F9C8562727A730F053D910C68B01602870C2E4292801C6B9AEF5932D67E3C9
            14A7FD93274F4DA6399C66AEE30B301AF4D1C0D77179A4DDD8990706608037D0
            1F5594D71E7A07F81040C6AA3AC0D715F82ACCA5878121FA77057E7068CE9340
            DF15F85E6ADF1DF83EF4DD836F43BF813F43D1166300C8020CE8470BFE7C51FD
            9C79D25ED5840D448AA51C08C36F2B9205F0D92B096CF8F5714E496401517888
            B02743FA081B00C6E935E2BBC6F151E30BF89CEAFBE073E620E3F99AEA0BF803
            A90F47F47E0C7DFF4143A4C77FC0E0A194306224656233D38C0C4A494F979A1F
            C37F4F7A0630910D604A724A82EB7A3FD972369E2C71E41F3491EBA8A6D97369
            CDE6EDC704BC2D8CCB6316DEBAADDB24FDF723BD0B7A7B482E04BA81DDEBB80B
            0DC7A10DF0B67306803ADF061EF297CFB2B064B67DE56A011B3F131E9EF361DF
            A3B03B80B7401729E81EEC6ED071E722865BD51DF00A3B7F6ED0FA2D11ADDBB2
            95D66DDE2AA68A453F0A7410761B784FB3E789EABC335E2BACACA1748EDC330A
            8BA54F207A16601EC308CCE3A011A8B28ACDDA8311132226802CE02906155373
            1F60B0039D7B3EF8E8D5E71AFF7180DF33087E6F447C53DFF7EEE7813FC8803F
            90C147D41F12379C060F8B03DC945F5824263023234B16028D6303C028000C60
            12670493A7243FE5BAE64FB69C8D27431CF9FF306EC2C4B76B9B5A680D5F7026
            E50F821FBC8B4D04764CC8D1C710A23FC6E1D7F3458C15760A7D107C6C88E106
            7FEFFE08F401F039829B1ADE3C472F3D7AFDDB9661EDBC5937AF6BE791F6EB52
            DA791DE6396A6E8CD16B94DF1E15FCA77DE89D437412DD23B0DBC2462401F043
            D077061FB047C08F008FE9D55B653D80AF4D5BE4B58ED5EB64924F187A37F873
            45B5FCB8B6158FE751CDAC3984F9FE912C804D401401DF2518809E017E866502
            2807B00A5133019405FD86C5730DCF7033D82803B4C6975E7D6B1CDF15F101BE
            D4F80C3E52FD7E5EC457F0870E8FA761F10952EB171415536149096103DAEC9C
            5CC25E944963C67AAB0F07D124CE68390BB8D675DD9F6C391B4FB4264E9AF2F1
            B1E3C66F2C2AAB20ACE28B401F84DD96C2AED36EED1978988C0330B13A10E97F
            24CA7706DE447840DF39CA436668CE16D7F0963AD6AC9514BFF3DA79B36E5E97
            D26269EDBACDDBC4009C51DE865D80DF6DA2BC9FCA478FF2D1818FD4F23EF05D
            45F800F05B8C187A15F63A5CB3097B1E6E96390012D52DD80DF02A0F7C863E2C
            BC5ED1D064460520BF3FC09111745726C014BC52C1CF04264E912C6070D26886
            B097180022BD59B1E71ECEEB0CBEA9EF35D51F68811F979028437D30004C4BAF
            AAAEA192B2322A2A2925DC7F22BFA080060C1D460F3DF1240D8D4F242E695F63
            03F8AAEBDA3FD972369E688D1E33AE5F724A2A2DE6741A8B78A2016FA6DE06EF
            5C63836F4FC8590403E08B1C6BE903A08B14F620F002BB053C3614B161DFFD0C
            D7EB0CB0CEB4C37CFBE59C95CC65C07DE0B1661ECF71F697CF2EA7D9ED4BD9D8
            3649DAAFB0FBD087A2BBB3775ECF02BBCA835EC0DF61C4A043DDA6F347013CEE
            980BD85763D2959C37D12ACECCF05AFB8A55027304FAE8C047344754336BB63C
            2FAAF24A010B7C290B900D00FCB03A990032824816808C0099808C0E4C984AC3
            464DA01E7DFA4B1680DE7CE9D5B787F3B473AF13F883A8FF60069FEB7B89F8C3
            BC88EF811F9F348286F363CE58A9AAA696AA5915332BA9ACBC82CF33694666A6
            4C0346068061C1295392E74E9C38E55CD7B57FB2E56C3C91E29AFFB363C68EDF
            5B515327D37A5DE06BA40F00CFA0479B7A8BE88F3DEE910120EDF7A16785A7D7
            FAD007C0B7A057E02DF0B58EC7D01D3214D938C3023E02BE2EA33573E9913A23
            DDEF94D27BB287E614F6B0C211DE8EF25D416F831F81BE33F81AE1FD59960CBC
            2FCECC44FC5887046B186837F8067603BC6AB6A8BA25A2ECE20A6302F9C604C2
            52F87D63E864022CF411785900CE182AC4EFC49C80DE43E2E8C11E3D240B40C4
            7FA487077E7838CF4BF525E27BE0A3BEB7237EFC88119438622425B0018CE214
            BFB2AA5A6E15568B5B97B10954565551356703895C16DCFFF81392FE630460D2
            E4298FB8AEFD5341CEC613A9B163C73D3E25651A2D5ABE5252FF6891BE13EC21
            E03BCDC0E36C623D1B00527F001F00DD87DD1B87B7600F00CF90BB7AE88DF6CA
            7B5672549FD38EDD70A26F9401CD5ED4219D85001D061081DD00DF09FA00E89D
            61DF6875DAA1AF431405F800F41EE836EC6B3CD835C2878107EC90E993D9402B
            D8F4F0FA42FE7B00B60D7D187617F455CDAD22BCAFBCBE4940C7D0A098401423
            986165016A04333CE990A191C90A500EA0A4881F3B5136EF7C804DE0314EF59F
            EA3B801EE24C001D7CE8D5870CF843197CAFC667F087C523E22778117FA4803F
            82C106FC63C68D17E0E7B7B58901343537517D7D0335353553766EAE8C3CC070
            E2478C4207E0AEF113267EC275ED9F0A72369E488D1A3D667E4149192DE78B0B
            77AA55E0C391FE68C187303D17BBD5C20050EF07C1B726E058D047053F04BDBD
            880699000C0070BBC0B7D7CD2303C019C062B8AE7BF0C3C01BF9511E903BC047
            E79D406F477907F41AE101BDCA063F083D8BA187700B6D5B1806AC66C023F0BB
            A1B7C1B785F68299D594965B48D3313CC8E9FB74002F43854103D02CC03C6679
            AF45E08F18005E472680B681F149749F37B16746760E65E7E57316D04B32004C
            E241C447B4478D8FBA5E237E02C01F398AC11F250690C48F51F3B7CE9E4D4B3A
            3A68FEBC369A33672ECD6213983D87FF76360544FDFB1F7B9CFA0E1E4C13264D
            A6F113273DEEBAEE4F15391B4F94129346FEF7B809935EAE696AF1E156E88F16
            76019EA37D78424E1B671418B2C2EC3B81DD02DD87DD023D08FBDE4EB0AB7401
            0DC6E0F13A2002DC06785578DDBC594A8B79F3000C5980C26E80EF0676567751
            3E0CBB1DDD2311DE00EF831E82DD075E615F1784DD681D97662CFE9E56F0EB58
            2A5CD56240EE0EF6CAA6594ECDE4EF5FD376740C468CC098812FAFC330680A5E
            16E0650881E77CCEE4DF8BF7F662D0EFBCFF41B917C0D37BF6D0CE9D3B293935
            5D86F4FAF41F40FD185C98806D00C31338FAF379E4E831B2A2AFA9A58556AF5E
            432B57ADA2F6C58B69E1C245347F7E1B2D5CB09066B32960211046189E6063C1
            30201BC08A7113269ED21B833A1B4F94468C1C75FDD49469EF35CD9D4FF33882
            2245C61A7A85DF873E0CFE0A737681AFC2EFDAB0758774F619E851B333E8B26A
            2E0C3E807783BF7DB7AAF3C41BCCBD0774AD9C0118E0718E002FE7857CF696CE
            B6B4B54B3F003AFA8E26CAFBD05BE09B086FC08F40BFD980BFB16BF06DF83B41
            CFA93DFA33007567E8D11F13015F4A33FE7E96B2704627606593318130F098F8
            A38F013A643FC61A013CC71D87D31970ACFB07F8782C66E0816F670392210076
            EFB979ACCFBDC79E1140D9A515B254184B836FBFEF7E7A8ACD602F5F073876F3
            7788FBFE67E5E6A1B79EC68E9F289D7B18DB9F9199251D7BF3DB16D0C64D9B68
            337FE66BD6ACA5E52B56D0D265CB68F19225B49CCFF3E6CDA7E15C1A609B71FC
            3F92468FA6899326BFC9A5C2297FA72067E389D2A83163C7A6F3870C0398D5B6
            90E6324418465BB4CABB49A50D7D57C07BB3EFEC1978188BC7B017A27F04F4A0
            04740B7601DE53787AADCACCB633822900CED90C3D008F80EF5E378F4534F8FB
            10F58F15F870843F96282F53A96DD8BD080FD8DDC07BB0B3FCBE180FF825FCBD
            D8C23028FE3E81DD023F2C85DDA58AC666560BE596CFA4D4DC02CE043CF82DF0
            8D1118F9CFBD367D1E019F1FB3A4CD3381AC920A592988A1B93B1E78906BF427
            69FEC2857C199AE3F5D7DFA043879EA5A7D91076ECDA453B594FF3B5B18F8307
            DAB630FC1B366CA475FC79AD5EBD5AB461C30689FC58F37FDFC38FCA48C3702E
            13B8EE7F77ECF80977F1AF755EF7A7929C8D2742A3C78EFBC8E831631BB2F20A
            A89EEBC786D973A965FE029AC3F0880930E880BE13EC2A0BFA00F83A11A76339
            6DE40C003DF506765B06FCCEB05BC033E0B6A4A77E279F51BBCBE35DDCBE5BC0
            45F4477AAF915E810FC85B368BF7026C80EF825DCE0ABBD73B6F8FBF2BECB6F4
            2625005FD74DA06F028AC01E1DF8C8A80B22BC01DD680D2D05E47C06EC8B456A
            CE7C96EF880D993F77D4FC803900BC037A800E9533F4E50D9EEA9BA882CF6575
            8D02B39602260BE0E7280500BA6700BE3CF00DFC7C56E8450CBE2D2F13C09E01
            981B70C77D0FD01DF73F40C969E95212BCF7DE7BF4F6DB6FD39B6FBE492F1F39
            42CF618B768C1AF175B28BCD60C78E1DBEB66FDF4E6BD7ACA1C29252D9F9E7DE
            471EA5071EEF41C3B85C983C35853388498FBAAEF95351CEC613A1D163C77F74
            D498710BB339E5ABC20D1B9B6751A398409B80845EF5AEA057E07DF0BD69B722
            36108CC563010E6A7D3BD22BF4987CD315F43A3417998813EEB0DB2993719065
            A0FE07E001F8F979585831D7C267008A5E7C3F9D67D8553A2C67A08F1EE5057A
            FE3DE108BF924187C2D0DBE0FBC073649794DE069EA5C0FBD04B06666017E8F9
            BB8016F1F780D11BB423BB41248F0E3EA2BC05BD077E40DC56505943696C009A
            0598B240B38188291803E0C79E014493C26F9E231328A7A91959324D18F5FAAD
            F7DC2773029089AEE0DA1E6600F85F7EF9657AE9A517E930EEE170E8103DBD7B
            37AD5BBF9EDA162CA0DCC2421A18172729BF4E25C68620A8FB39ED3F25E7FC47
            93B3F144883380FFC725403B3280B29A5A9A59D740D5B87923670328095AF982
            42BFC0C265DD00CFB04366F65D64061EE6AB23CAE2E62066A6DD31C2EE836E60
            772D9EC1041CEC3980ADB065B71C0BF6689B64A0D77CC9AAB59239F863F00ABC
            9C0DF07E3A2FA04781DD03BEAB281F865D64010FD83B1872E868608710F18DCC
            D4673C6E436720477E447227F021D8CB6C71E4874A71E6E7E8104CCDCD974C00
            46604C801F5B26E01B0183ED7A1ECE10003FCC008FD131884943632627D3E3BD
            FBD25D0F3C44B7DC7DAF9C313C884D3D26262753EA8C0C4ACBC8A44929D3646A
            6F9F4143642401AB0701FF833D9EA0FB39F2F71D3C449600B34EC9157F5DC9D9
            78223472F4D87359AD1896299E5949A5D53562021811A86F9DED9B00A22B6E50
            E18AF29DC0B766E0CD656D644811F97DF0BB833E14E1A382CFDA281D78A8E577
            D27C369BE6F9110388B63B8E18C0DC36F97B90FA778AF49D22BC057E087A17F8
            DA6B1F49E7556B451AE925C27B515EA1F7C117E86DF0C3D0B301E3FBB0C59F3F
            DA3121A8BC81D3F9F701BEA8B641CEC5D57502B1C9040A290DF0FB4610813DDA
            F34EF07732836231801C2C4DE6F7278E9B40BD060C94E13BDCE5074B856F6543
            407670DBBDD833E05E39DFF9C083DEDA8227FD9985D874640CFF3CC37FCAEEFC
            DB959C8D274A23478DCE9C367D06159495CB2D9F4BAB8C09543735531DD794D2
            39B820D239E88AF412ED43B3F030268F33223422BF0FBB077CD431F828C00376
            BBD30ED28E3B3CC64E3988ECD1A0B7D7CE63F1CC6CFE7BC251DE447AABE3AE4B
            E023B0FBC01F05EC9D800FC3EE011F801D513E043BF60754CD5FCA9F35477FDD
            3310401F13F0AC9280EAF9B506CAABA8940EC1340F7C988196060A7AF839A480
            FBCF3DF8B5337086374F40171221DBC82DAF9425C65339DA8F9E3C9586268DA0
            7E43E3A837477C00DE9F1FE3BE8213A7A5D2E084443FF5C7661F98143476DCF8
            F42B6FBBD0798D9FEA72369E28258D18F9C0244EB5F24ACB28AFA4446EF4884C
            A0A2AE9EAA388AC0041AE7CCA3168668EEA28E08F821E0E72D8E80AF13727051
            C20010F923D01F3DF861E021851EF30BB4E30E7D00B8F8B11EBE2BF075ED3C56
            CCE13580BD06FB1B5AD0AFDAA0D01BE03B47793311C799D633F4E891975D8A59
            D1A05F1C4EEDA3816F011F805EB2AC6592F5E8FD00E76126247FE6306A74000A
            E8C7047EBDAFE29A88328A500A18133006C050FB8F3DF821C0CEE74E59004BFB
            006CF875ED406631647619CA29ABA0FC8A2A2A98594579E53365E312DCB61C8F
            0BB8BD84FF3DD86A0C911FFB0B60B30F2E6339F28F9FE6BAB64F17391B4F9486
            C50DFFC6D809135FCD2E28A46CDCDEA9C4DCED159940055F0C3081DA59ADD420
            26B080662F5CE2431F81DD3D030F2681053388FAAED4BE2BD815745B919E7A33
            F1463BEDF0DA420605061086DDDF2803E2C81F593B3F9F215DC7D13F18E903A0
            7BB01BD9A0EBD01C47780F78EC7DA0B00BF01EE802BB001F84DD065DB4CC08C0
            FBA05B02EC3EF0F219F367CE9FB1D11211E63FCC5DDC217F9BA6F2C70A3C54C4
            E93F84C7F9334D87606AAE01DE1620F71FAB09007C2F0388406F2604F9E05B3B
            0D63E190A8B49C723CE14624023F839F0F7126525C5D4BE3535225F2DFF3F0A3
            F464BF013472CC586203C8775DD7A7939C8D274A57FCE6871F491C316A455A66
            96C0AF2650585E412595D5548E4C80EBC89A663601AE2F9B18A4D685ED01D86D
            E92C3C8C222052016E033F436F016F438F081E065F87E700FA7A853D04FE3A74
            DE6DC20619DB0422801D86DD96BD761E1367001CD27F5DF28C5585EE94DE839E
            0D03A6118EF0766437D19D21E7B31FD905789501DE8FEE967CE0F973830CEC00
            1DE2CFD7025E605FC467A87DB10CDDCAFC078C802C68978EC0921A03BD013F02
            BC0D7D5175107AA8B0AA56A4CF33FC2CC065043001806FA017F02D0310F065A1
            10527EEF6E43B809A9A708F41EF82C1F7C2FF203FED193A6C888C1DD0F3D22B7
            FD1A311AF08FAF8F1F31FA63AEEBFA7492B3F1442A2169C4406C98905B5C2206
            103181995452C526C0174C6543139B400BE1A693C604309EAEC043E6A2D469B7
            188A5BB06CB90FBE026E4B61B71588F001D8755C7E6BA0D30E00A3AD7DE52A01
            DB05BBCADE28A3AE752E1B5687447D8DF07694D7C93712E515F8552A865DC0B7
            227C087891026F45F74EB0DBD04B66E541AFA60AD02DC9E7AC939DF83336F31E
            30FCC9E2FA1F9ACD8F6B67CD61B0EB9CD087815729F801317CF9DE3A011B7E8D
            F602BE07BF8EFD2BF4BA9D98B9DB50087C8EFA023EA7F82ADC9118B2E147DA3F
            66CA548EFA8FD0DD1CF91FEDD59B386021F237C58F18F531D7F57CBAC9D97822
            95347AF43792468D7E2333AF80728A8AA398401D9B40239BC02C334C380F9D83
            E6CE3306FCE0EC3B8CB5E3A2D7481FD908C382DD03DE95D6DB33EE1478BFC3CE
            D7265ACD75FB5A360200596F01EFC36E6D9661D6CC9B75F35838D3D2B650227F
            00788EF0023C838E61391FF65506F6A8C0CB105D04F800EC6C84221B769649EB
            D17F12C9A002515E23BCF7D91AE03DD83DE0F11D88BC214FFC4D780E9306F400
            3B1AF44EE0599807600B6DE8AD870184C117E865D65FB0BEB76F28628057017C
            055EE5A5FB9CEA1788AA58D554CA0686B41F3B0463D80F9387B0F71FC3BF2069
            D4A84FBBAEE5D351CEC613AD84C411D327B0D36A19E09B007F9162022807F80B
            99596F4CA08E016A64D070C129F4B67031A2530BF3EC6DF8057A6FE69D13FA00
            F8A1F1780B7A483BEED00E488351DE0DBE0AABE6902120B29BF45EA3BC55C703
            7ACCBAB3A07781EF8AF29DA067D0DB047853C7CF5DA2D04780B723BC0FBD808F
            198E11F0157A9DE780EF0032A31F0B3C2D943200F01E0DF42A17FC107E368361
            36330435C537B2EB7BFFB66261F825D5AF08C1AF115FC137F017CEAC92D23385
            CB52D4FC773DF4B02C27C6E2A0D163C6CD4D1A35E6DF5DD7F0E92A67E389D690
            E1F1FF9E3862E433E959D99D4C2097BFD002FEC28AF1C570260013A86E9AC569
            E66CE91C44A79B8CBFE3E2940BD4CCB86B673810FD35D22BE85DC11E04DE2C9E
            0900EF4DAFB53BEDB09A0EC046033EB849861136D1C0B99DE1459ABFC4833D00
            BC3744D729CA876017E015F44E111EC02F1545A23C148CF24ED8F9738482C01B
            D85BDA30E4A9B02FE0886FA4FD1F788CA9C1459CC2DB80DB0AC30EB9DE5704B1
            0114701050F00DF426C5B7C18FD4F826C537F5BDA9ED157C49F143E0037AA8A8
            B28A2AEAEB697A6EBEACE7C7B83F26FBC42524A1D36F6EC2E8D11F775DBFA7B3
            9C8D2743C313126F46CF6A663E9702567F80318112992B50CC5F10660D56B009
            5435B5506DCB6C860EFD029E09781203606810F503D07BC087C18F40EF81AFC0
            B3744E7D047AABB79EEB779C6100E1281F865E77C7D175F3D52DAD0C668774E6
            39A157E011E1597674F71F7BB09B081F829E61D7A1B940940F47785624ADD7CF
            D0A4F526B5D7086FA0D7910E851EE97EA4EF834B20C982E68939633CBFC082D9
            053D6403AF32E01B616210EA71F4CE63F350FB8621067C5627F023F06B5D6F54
            69D2FD99003F023FAEAD72867F5A66B60CF5614210223F96068F1A3D666BD288
            515F725DB7A7BB9C8D274BF10949C9B8A102A0779B80C9044AF9A2A8E08B0BC3
            841821A867C07001EA441C5C984B182844FE08EC16F03EF426CA2BECE1088FF1
            F808ECF6B09CD553CF67CD005CC09B4D323A6F94815573800DE54318761B7891
            3D0E6F811E005EA3BC44F8A57E7407ECC1941E0A45F910EC12E1BDE86E47F808
            ECE8F034B08BF86FD70C480503C09C0074E27507BCC00E79C0FBD00BF846A8C9
            714694F7C117E8BDDA5E3BF658C114DF48A23D036F835FE445FDE2AA6ACE2C1B
            E4F6E2F73FD643160A61965F5C7C228D1C35661B67A7A7E4869EC743CEC693A5
            E109A33E3A3C3EB165EC8449620076A7A06F02E54113C0084175B32909705122
            FA43E850C3109E0DBD59316704D8157A03BE421F04BFD3F09C82EF75DAE18CDE
            79D4FEC1281F01DE065F55C90600A090A938C1B727E020A5F726DF04C0F7A3BC
            89F473B01F8105BD0FBE40EF457A8DF05E5A8F65D82EF06DE80DF821E85961E8
            25FB61F353C1F890BEE77715E5210B7A8C1EC8088227051FE732FEBE8B18D660
            E79E46FB10F8150ABE81BF5052FD4A869EC5D02BF8E864460773465E01A7FB4F
            D2ED0C3FC6FAB10BF0885163F625248DFA96EB5A3D53E46C3C998A4F4AFA02A7
            5DEBC74F9E6A8606C3265062FA04E0DE9835A8C384E81740E720D24FA4A84BD7
            AEE3B4DFF4DEFB11DE073E04BB07BC3D1E6F405759C373ABCDD09C4CBEF1A6D9
            A276C7FF1760DBD1DE061ED2F5F2BA661E90B8A23CA6D73A81F7A3BCD9802402
            BC15E915768DEEBE0CEC36F09DA3BC07BB07BC0DBB0DBC5DEAE06F10D3E3BF1B
            D2BF1D8FF11A66026AD477021F8AF436F822FE7E5565109B00527803BE76E805
            C157E84D7D6F435FED43AF02FC99058592F60BFC0F3D4203860CA511A3C7EC4F
            1839F294DFD0E383CAD978B2159F38E28BC3E2E2E7A80974CA047C13A8E42FD1
            98C04CFE229109D430688011C0CA5A79865C81C75960F7149880B3064372381B
            E0750C5E7BE8CDE41B0F7AF4D2037C6B020E0001D841E05541F055D5FC1CBDF2
            A8EB05780B7A8CC79B21BA650CBB99E0140D761F783EDB35BCDF71E76545984D
            29B08B2CD815780BFA08EC46F5AD7CF6227B18765BE6B5C863FC9D0ABD0FBC05
            BA0DBC9C6DD8432AAF6DA072368012FE5D88F8F99C0DFAB5BD073E22BD89F826
            CA43C50A7E7535070DA84654C5D74C7E59293DFC642FBAE59EFB64B80FBB028F
            18397A4BD288D16774E457391B4F050D1C1EF789A171F12DE3264EA6AC8222B7
            09F0051031813A192130D387E7C83D0634CA07F7B9B3A18F00EF438F5E791F76
            4F0CBC400F7933EFFC8EBB95669AAD6D0036F02A1B7C48D7CD035EEDB58F40EF
            016FF5D4778AF0AA4084B7EA780FFA00F00ABDD769271D771EF0023D1B6720C2
            6B748F52D618135079EDFCF7A37336F29ED902B40B7C3FCA43FC1E17F8003EAC
            0AAED70B196CEDD537E01BF8EDDABE04F222BD0D7E191B485563235F3FE5F444
            DFFEB2F20FB3FCFA32FC492347BF923062E4F75CD7E4992867E3A9A2F8F8A44F
            0D1D36BC75CCF8895C0A983E00DB04D04F905F5A664C80D3CCB29A7AAAA83399
            00D6A7A32310A9BCC2AEA01BD80DF081E8EECDB413D83B816E60F787E5ACDA1D
            3DF718D707D85DC1DE69938C86668154C6E6176B5A1FACDD7DD0ED4EBBA8B01B
            E04D4A6F60B781B77BE915761F782FBA478DF280BAC57B2E8F8D04765FAD02BC
            808FD7F88CB2AC924D19513B0CFBB1006F0BD91EC6EA057CFEEE4D9A6FC0476F
            7E495510FC32811ED7472D95B36A9A9AC4301E7FAA0FDD7CD73D741722FFE021
            98E5F76A42D2C83FB8AEC53355CEC65349C386C77F8A338159FEE880A3631026
            80940F695E297FC1950CD66C86643E4752CC0700EC0A7D07A00F47796F9AAD99
            75D719FA30F836FCD87C1467A4D080DA097E087EB32D16D6CB37317CF30DFC56
            748F801F829E65A7F5067CBB8EB7D2FA2EA0B7237C007A2BCA63AB6F086023AB
            B1C197E7BEB0BFBFCA031FE2E722BC870D5980F7E00F43AFEA0A7A015FC50650
            D5D82440C3FCD1290CF08B6DF005FE08F8027F6D2D55F3CFE1BD4FF4ED473773
            E4BFF38187A8CFC041943872E49B5C7A5EEEBA06CF64391B4F350D894BFCCCE0
            61C3D78C1C3B5E0CC06902DE9E028802D853A0892FF65606651EA7D1D8B906B5
            BB996D17843D087C67D8ED85347217605FE8B4331D77E8C0430600A85D91DE40
            DF79871C2C91AD6E9ECDF02FF1A0471D0FE00DEC913A9EE5036F477903BDC2EE
            436FA7F451A0F753FB509417E859DA8F11811DE58D073A9E03765F0676C9003C
            996C2022DC0BD0057A34E07DD821065E854EBB4A4EDF91C2435839AAA9BE420F
            95D7400C7D5D9D9487150C3F223FDEF744BFFE12F9D1E9D7938D203E69E4DFE3
            12924EC99B777ED872369E8A8A4B48F8DAE0A1C396E1BEEBCE8EC1E262CE04D8
            04B826C4175FC71760136EDAD0B6404C00C002F208F841E86DF0DDD09BDE7AED
            A9379370D0336F9E23D2EA765811E86DF09B8C187C7FB30C3680999C29A08607
            F800BE7BE81D753CA23C4B8157D8057C05DE4BE96DE86DC815F4F0631F7C1580
            E6B3C8825ECFDA1E6EC3C4AD00FC0C3614063F00BF42CFA0DBD0AB10CDF13E93
            EA23D2B36AD11F64A2BD80CF06309355CDF0A30DF707B8F1CEBBE9B67B1F901B
            8272D47F353E31F13AD7357736C8D978AA6AC8B0848F0F1E1AD73266C22481DE
            9509607311AC1D400FAFD968748E98C0DC76EC36BC9C1629F05D46796F68CE06
            9E85C53346003FD26987E788B83000815D237DBD89F461E94619582A5BC16780
            2DE9BD0FBC46F7AE81F7A3BCD6F21EECE1082FC05B500701B7C5B07B501BE84D
            9B89FA41A0FDC780DD035EDBEDF7D902CC61E85D515EA177012F629821447408
            1BC8688A6F430F55D6D77309C29F7B4D35F51E34986E02FC1CF951FF0F4F48FA
            2B1BC0A5AE6BED6C91B3F154D6A0A1C33E3368C8D059A3BC3E814E1D83452592
            05A0A7B7922F2CEC31D8C026D0C210CDE1280B58013A80F7EFE96FC18E745EF7
            16C4B09C802EB063D24D04FA79987C83C5348B97C8192022A28741EF043D36C8
            8018FED25A7346F920113E04BB019D1FCF69A37A44782FCAD77166A3E93C2047
            475B9D82DE097603B33E36ED1150217D4FA4CD80AF115E1EE32CC3AC11A0FDD7
            B8BDB6C5BC869999FABA31064CD26AE57F1FB200364885BDDE1360F7E484DD92
            025FD38C19A046B52C8DEE027E3D432FE01B01FEEAC606D9DAEBFADBEEE2C87F
            BFDCB947EEFC9398749FEB1A3B9BE46C3CD535342EFE1383870C6B1939661C65
            1514769A368C0545451595D20184E8A21B8D363340E81CC49C78815DA037E0DB
            D1DD447833BDD6806FE44FB3C5F01C4BA7D7A2864704B60D4081471B147D879C
            7A8119437501F0B58ED7E8EEA5F57E64B7A3BB278DEE0A34E61984DB145AF39A
            D5C6CFF5B58000BD07BEB35D5FF37EDEC08F36630AFAB8CE7B1C88F221E803F0
            33D4E1481F06DF5655031B8B82DF00D5737B13D5F2EF1B1C9F2069FF2D77DF47
            8FF7EA2DB7FC8A8B4FECEDBAB6CE36391B4F070D1E12F7E98183872E4F1A3596
            B218FA7026805584667BB16ABE30EAF9426AF6FA0522DB8B4560F78057D07DD8
            CD421A1D9357E0EDE5B1E8A1475B1DFF5E40DD09F800EC11E875930C4C9505A0
            E8B9D7745E610F001F823D58C37B405B50FBB2DBF5B1F73C003414863ADCEE3F
            C6D983DD7A6F00FCE616237DEE09F7807002EF829EC18E067C5D4B675531F455
            1CED11F1F1BCBEA5858630ECD7DF76A7C0FF58CFA768D8F00468A0EB9A3A1BE5
            6C3C5D34282EFE2B6C026B466074A0B8F3E8806E2A62761B6613E0DA1C26D0C0
            2934D26D801C89F0BA6ACEAC9C3351DE033E0CBD07BE0ECDE1316015D8A3821F
            7D771C8C1CF89D77760D1F809ED3721F7A37D001D9AF89CCCC43BCE683ED4966
            50AAB4DD6EF365BDC630BB140DFC3A861102CCDD826FC17F34E0D7CFE2328F55
            DB84DFC9F073E4C7F3F891A3E986DBEFE4BAFF1E7AE8F12705FEA1C313E25DD7
            D2D92A67E3E9A4C171F1FF3260D010D327C006E0CA04C404AAABCD46A30DB8B8
            CCCE423001B9F700C38E4E42D9DFCE83DE06DDC81B9A83DA8273EA21008B25AB
            AE281F16A057618E3C4A068DF6768437C01B6815644C34F2DB42AF19017496D7
            EE03EDBD3700B4BE66B7855F6378056C4FFA185BB40174395BAFD732E42EA104
            50BD6FD8196A08C02BF4AAC6569C9BBDC7B32861F418BA81233FE0BFEF91C769
            F0D038ACEB7FCC750D9DCD72369E6EEA3F60D0A7FB0F1CDC3A62CC38811ED940
            C004BC4C407716AAAC6FE40BCFF40B34CEE592800136113E38F9260CBDC2AEB3
            EEB4A71E1D78B5FCBB007734F06DE86DF8B150068621919EA37BA403CF063A02
            BEB915B7F73CA020F8023BA4407BC27BA281EFBF2667230379047000AFF0CB73
            7D9F037A2802BEC90020C0DD15F8900D7E3D1402DE16E007F42D736653D3EC56
            1A9A9844D731FC37DC71373DF0680F1A3C6C38A27F92EBDA39DBE56C3C1D3564
            F0D08FB30934C304500AB833810A99348221234C1642AF34EA58EC27D0CC20DB
            C02BEC8171780F78D4EBD25B3F6FBEA73689DA454701BC4B78AD0A00F2BF0560
            8BF0D87E0EA8E56C40356785DF002D007BAFEBB9DA0338D816791E7E4D810E80
            8EC7D286D7226D4EE0F93D75D66B3EF8B33A9B800B761F7A06DB05BD813D023D
            D4C46A9ED34A73DAE651E2E8B174ED2DB7D38D0C3F76F21DC4919FD3FEECDE03
            069DEBBA6ECE76391B4F57B1017CA6EF804173478E317D026113409F40643F01
            DC7B80C19392802F4A4EBF319D17A047C6E2DB7CE8FDF1780FFA484FFD3C19A6
            436D1E065FE10E030FE9E6182AF40354336455900F363ACD0CF40ABEB4C93902
            BD802B67FE1DAC30D44691D7FCD77DD855067A05DF3CC67BF8EC2908BB799FFD
            DC863C9AD039D7097C4EDF5DE037EA3904BD822FF073D49FB770014D9E96CA35
            FFDD74FDED77D1BD0F3D460387C4D190B8F8A2FB1F7AE41CD7F512D3196600D0
            C021C3BEC026B03E892301328170398021C33C6FC62066909531A0C8062A1940
            D4DCBAF5B881DD0CCBF94B653DE8A5B7DEEAB1C719D13B1AECB6C2E06BFBCCC6
            662F033070E2469B0ABEC90014FCA00CCC06EEC87395D78EBFCD7ACD8EF09DC4
            708AF4319F6DE8055CB479ED00DA3701813AD2DE591EEC96BA8FF49D816F9A6D
            04F09B39ED9FB7A88D52664CA71BB9DEBFEED63BCCB2DEC14369C8B0E195BDFB
            0DF807D775129391B3F174D780C143BFD8A7DF80B9280710F56104982F808D1F
            20E92C2C2933CB89B924C0EE42585D86454488ACE88C53E06DD8057859176F6F
            FF6586E9B0F8C7061D0AC32E0ABD07C27A79CC08540388C01E89F02EA8F13C62
            0AE6B9C2DEE9FD9E00B49E036240F56CC30ED530A802B92F86D7930D7BE0315E
            979FEB0CBB0BF808F421D8C3C00BF4E63C6BEE6C6A6B5F48A9991992F203FE3B
            1FC09A7E813FABCFC0C11F735D1F3145E46C3C13D4AFFFC04F7226D082BBB864
            1798E88F0D47A10C9CF939FA05CC2222EC29C0D9404D1D83D8C8D1972F60C906
            2251DE0CCD4586E7A4975E3BEDF8B91A80137A960B7A5BE5FCFF850144C07503
            8CB620F42C988167089066059D205731A0E1C79DA097339E075F0B43AFE0FBAF
            7BB0DBEA1E7A07F81EF49DC067B5400CFF7C8EFC5352A7D10D77DC45D770DD8F
            BDFCFA0D1C82B43FD7754DC4D459CEC63345FD060EFE54EFBE0367258E1A2D19
            009491974F33A0DC7C368342D36128D980594968B2014C57453630CB8FF03A34
            17987C63096B00A2C11E009E7F7F784B2C085B5DF95033CC3021086D55DCA6F2
            5F93C7FC7E798F6907C836F8A61D5365F1B7045F93482F90DB3DF1D1DA5921D0
            550239CEFAD8023E0C7D97693DE480DD07DE1222FF82F60534353D557AFBAFBD
            E50E59D9D767C020F4F82FE8D9BBEF475DD7434C9DE56C3C93D4B7FFC04FF7E9
            3FA035C9DB721CD11FFBBECFC8CDE373AE6C06899984D86032AF9CB301AC2DAF
            AA21AC5B473680557D61E8B5575ED7FDE3B1DE08A33BF06DE8EDDD71CAF8FF07
            407DF03DC8F579A4DD831EE2D76D85A1AF51F0F9BD3EF81EB8FE99DF639E1BB0
            03D0430EE82185DD56F791DE017E94481F86DE80DF4AAD1EFCD3B3B2E8FADBEF
            A4AB6FBE8D6EBDF77E857F45FF41433EEBBA0E6272CBD978A669D0D0B87FE172
            606DE2A83112FD91054CCFC9A3F49C5C4ACFCE15434036905D5462B2012E09D0
            37801B4396D5D54B079D013DB2D9073A0DF539CE788F0B78740C0AF016EC2A7B
            871C640018968C80EE89C194681F4D1EE836EC386B1B80B6A196E7DC5EEBBD66
            431D0D76E858808F44FA08F461E07DD8AD68DF097A061ED023E203FCD67906FE
            FC9262BAE9AE7B057E4CF1EDD37F206AFE55E800767DFF314597B3F14C54FF21
            C3BED677E0E01518273625401EA565E7B001E4505A568E18C20CCE0EB20A8B25
            1BC08693B8555411B2018614B3F5007DD0087407A016C90002919E7FC6057D18
            7C158C065B670160310286588CC002DD4FE5BDC702BDFD18E033AC36F8FE63EF
            3D00DF079B211613381AF0314C1765A8AE33F8D123BD0F7C57E0B334DA037A9C
            67F379D192855456592ECB79FF7CC3CD74339BC053FD07D190E1092B070E8DFB
            B2EB7B8FA96B391BCF54717AF8C97E0307B72013988EE8CF02FCA959D922C906
            D81C32D169585CEAED3C8B6C002650EF9980821F1186EC90017417E57DD843D2
            4D3260005AE777025FA5EDAC00E8B69A9A4C846729C8AEF7D9A0433EEC96A2C1
            EE023E0C7B20D233D45DC1EE03AFD0B300BD4A227F7111D7FA0F32FCB7D0AD88
            FC9CF60F1D9ED03E70F0D07F737DDF31752F67E3992CBE583EC326302B71F418
            B9130CB280D4CC6C9A9699254A4536C02541069B40164A82526403D878B25A40
            2EAF6B8C808F0E3A39F37386D787BD3BE06B1978C8031FC23AF94A5918E300DE
            3B4B8DCF8F0320DBF3E9F935053FF01E966D0201E8A1A3003E027B14E0F9ECC3
            DE1DF09EBA025E3567FE1C6A5FB2880A4B39EDBFF31EBAE2869B64692FF6F11B
            1A9FB08D4DFD73F85E7184BFEB98BA97B3F14C17A78B9FEC37684873D2987126
            0380016464518A28534C203D5012201398C999803101740E5632645AAFE3B16F
            000CB80B7A01DF025EA1B7A5068012400DC07E2C002BF0223CB764BF8EC72C1B
            761F7A0BF8A307BF9BB4BE1BF035CA7717E96DF0A1458B1752E9CC32E9E8FBF3
            F537D10DB7DD454FF6E9CFF0273E3F60E8D01FE1FBECEA087FF73105E56C3C1B
            347468E2A7060C1EDA811983B821640A3423939245196208695C22C0043067C0
            F40BC004AA648B6B000C60D50450027405BB2A0CBDBD25969D01D830EBCA39B3
            8A8E5F97D7F03E0F76086D1EE0DD011F0DF663069EC1EE0EF830EC2EE015F6B0
            162D5940E55533B9E6BF9FAEB8FE6619F27BB24F3F1A169FF4FC80C1C37E8EEF
            F11FFEE11FCED1C3631E071EDBCF9DD7404C67B1014083E2867F79C09061EB31
            442826C0D11FF04F9D6E9432834D40460972FD7E81BCB2722A98895D68F58E44
            E8174006D0D425FC5D81AFC256D7269A47A037F2B20086D99880F51AB71D6BA4
            3F5EE087A13F1EE0CF6D336AEF58448D2D4D72C38E4BAFBD4116F8F478AA2F0D
            4B487A61D0D0B8DFE2FB63E699FF7F38F71FFFF11F45308373CF3DD76506CE23
            7C3D9C8D72369E4D1A3234E15F070E899B95386AAC9400C800A6A6CFA029A2E9
            F27C9A571264E85061299B40C54CB9E5144CA0AA1159407354D85DC0EB3E78E1
            CD2F157640DD09760FF86381DD15ED8F09F62E8057D88D82C01F0BEC46737DA1
            B7BFB1A5811EEBF5145D76ED8D32D1E789DEFDB09E7F5FEFBEFD7F8AEF8D8F7F
            64D84570013E6000FF609B01DA6008FC5E9721743286F0B57136C8D978B68933
            81CFB009B4A24F0065C0D4E906FEC96946C8069021A809A05FC09840A5DC8C44
            EE52CC254054E8A110F836F42AEC8EA3A9BD2BCABBE03F5AE883F01F1FF0FD28
            7F1CC09FE7693147FEA6594D74DFA33DE892ABAF93C88F9A3F2E71C4F34FF5ED
            7F1EBE2F0EF01F63B0FF89F5FF3C7DD4130C01D48B2984CC40B303940DE03D6C
            0C81237C8D9CA972369E8D1A327CE4C7070E1D2E1D8388FE027F6A3A4DF28436
            6408280966C8EC4198805950847504E6DE8441D88F06787B4BAC30F061D85DC0
            DBD047073E027D77C087615705A067B0DF1FF041D8450B226AE79A7FD6EC667A
            E88927E9D2ABAFA7AB6EBA957A70E41F9E38F29D9EBDFB5E85EF898F4F32C49F
            607DDC330235033504DB0CC410F4603390ACC03605FE7DB609E8E34EC610BE5E
            CE14391BCF560D191EFF9941C386CFC11E83001EE04F9C96E66B729A318154CF
            04644151096E4BC6E5001613C1042CE0EDF43E00BBF7F8A880D7730876D7D658
            00BD215A84F714065EA1B7E1D7613A03FE6C910DBC0DBE403ECF9305FC1C17F4
            16ECF34342E49F33AF951EE9F914FDE9AAEB64A2CF433D7AD2F0A491EFF6EE37
            E0617C3F7C7C8AF569EF0C7D12524360D8A1AE0C41B203EF0C138019881140DC
            F4117E8E0CC3650AFE11BE6E4E67391BCF660D1E9EF8B9C1C313D627B109200B
            9838CD98C084945411DAB45F40A610171813C06222DC730E9940654343F751BE
            3BF0AD086F836F47771BFC532BB58FD4F3E1481F06BF6DC13C5ACC911F8F9FEC
            DB5FD2FE3F5F7F333DF0580F8A4B1A494FF51BD0CBE3EE9F59FFE29D3FE30966
            A0860023B0B303CD10D408F4ACA6E09B8177882178F24D810F291970F68E33CA
            109C8D67BB8624247E71505CFC3C98C0A45498402A8D4F86A6896008C810B45F
            20B3A080B28B4BA8A0ACC2330173FBE90F23AD8FC01E01FEFDC0EE049EC176C1
            EE023E027B0478575A1F807DE13C5F0BBCF3928E857C9E4BBDFA0DA08BAFBA96
            AEB8FE26BAFFB12718FE516FF5EEDFFF31E6EBA32CC0FEAF9E600261235033B0
            33834F409E11F866C0E7B011D8E5826607CC7CC40CEC2C810F310379103A5CD7
            D2A92E67634C6C02F1233E35243EB12571CC383681341FFE7153A114C906D051
            889200538A330AB0B4984D40FA04AAE42E35001F801F6B94EF1AFC0F16E54F04
            F836F461F801BE689189FC4B58FD060FA13FFEF95ABA9CE17FE8094EFB478CFE
            7B8FA7FADECF4C013240FFEFAC7FB3CE6A06614350530864069E6006AEEC209A
            21D819829A412743E0D79D66A087EBDA3A95E46C8CC968F0F0119F1C129F346B
            E4D809D21F00F8C732FC63A7248B26B021A024889840816C3956505E2E1D8333
            715FBAA6930B7C27D8BB003E0C7B10F86348EB3DD8C3C0430BBD33C047F41F14
            1747175F792D5D76ED0DF4E0634F52C2C831D4B377FF27999D7F64FD07EBB3DE
            59A526A072194157998166071F8760042CC90C3CD9466067079219409E11F886
            C042DF813FCA20FF31C7299F25381B638A68587CD2A7870C4F9C3572DC0489FA
            63A7180318C31A3D3999C6B1094C8209CCF04C20DF980076202EF34CA0AEA5C9
            097E18FA63069F013F6AF019F00F02BE0FFD07005F05F03B962EA2B8C4248EFC
            D708FCF73DFAB8C0DF6FD0D0C9CC09E004E89F677D8E05135023D0335EEFCA0C
            600461437066069EFCCC8015CE0CD414D40CD410C40DF85023904E4574244268
            E3B78809443C2172B8AEB7132D67634C410D1B31F233431392568FE04C00C08F
            993C95E1674D32426680BE82E48C4C595CA426500413A8C69D8AD904BC9B561C
            35F01EECAE481F86FD43059EC1FE60C0CF172D6A3767A4FDCB962FA284512325
            EDBFE4EAEBE9CE071E31F00F1E3A83B900A000FC0B9E60026123B00D41752C99
            816D043887CD00FA180B8610C80E2086DA65062A392C53B04B868FF04BA75476
            E06C8CA9B386258EFCEAD084114B478E9B2865000C60D4A429346A228BCFC80C
            26729930757AC404724BD8042A66CAADA9ABD90470830BC0AEE03759E06B946F
            F6E0B7A3BBAD00F49082CF608725B07BE700F80C7A6498EEFD83EFC3DE0DF82A
            44FDE5CBDB2971F46889FC18EEC37DFA87258DA20143E2D29801800B90FF8BF5
            9F9EC226A00A1B017ECE6504100CA0BB32410D41B3033F33B00453D092C1CE0C
            5CE5020E3DFB46E09981940C68E3DFA7D941C0105CD7E0872167634C6E0D183A
            FC936C04CD23C68CE72C20D9C0CF1A3961B2086D28133073302D2B5BB61BC3BD
            098A2A2AA89C3381EA860681DF4FE93DD88F36CA43A76A5AEF021E6A5FDC26D2
            B47F5862225DE4C18F1D7CE339F2F71D3818693FA004E45FF40413B08D206C06
            2E430867042E33081B812DDB10D40C60029DCA05168CC0EE3FF828CB3604DB0C
            F48C92C0CF0CD41470E6666407FC6BC5104E5876E06C8C2922FBC073CE023E33
            2C6144EB88715C0E70D407F823449368C4F84952128809A4CF3026909F2F2650
            CCE5004CA0A6B15E223E40C76DACC2D1DD865F27E4F8C05BD003721B7C81DC9A
            8CA3C01FEB841C8CCB8BBA04DE823D04BE026FAB83E15FB56A298D1A3796FE70
            F995F4C72BAFA5DBEE7B90E2478DA5FE26F2034A00FDDFAC2F79B24D40050350
            23886606765610368468461036033B2B0867066A0481AC80F54F10B3EB67077C
            8629D8860013B0A547A04CE0C76206FCB3FC2B2347F8DA3C1E72369EED0A1DF6
            B7207798E9D177C0A7386D6D19CDE023F507F85012C425C268CE0AC67BC38430
            016C469A07134026505B2D77B185018481F7C1FF00F57C24CA3BC0B7E0EF043E
            831E80DE09BE815F610F2B0CFE62167AFB57AF5E4A2969D3E8628EFAE8F1BFF5
            9E07683847FE417109D5FC99024E40FD15160C40651B41D80CEC8C408DC03684
            6846E0CA0A60042E33800944CB0AD408C259816F0A6A04DE396C047676601F7E
            6660493A1371E6DF113085F075FB7EE46C3C1BD5CDA1A91B24779A193A2CE153
            5C0E2C01EC88FA89632708FC89103F1E3971B2CC1BC084216C379699E7650233
            67D2CCDA5AAA6B6EA4164EFD3F28F041E83F786A1F84DD00EF823E0CBB026F0B
            917FCD9AA5343D235D66F85D74C5D574D39DF74AE41F9A3872E1FFFEDFB7FE87
            3F5B00FB55160C00FAB227DB0C6000D132033503350435013582689941776600
            F8EDCC206C047A8E66067666A067E9445443F01436033DCB3587B36700C81202
            D90184237C2D1F8B9C8D679BBC2310E9211CF806147C3EB0CA4C9C1C3FD767D0
            90AFC58D18BD6914477E009FC0E0037E9C13C68EB74C60BAEC3A041340265032
            B3822AEB6AA8BEB9C980CF601F57F019F06305DF95E21F33F84B8C96742CA0A5
            4B17D2BA75CB292B374B7AFAFF70F95574FD6D77117F5EE8F45BFCEDEF7DFFDB
            FC1903D8AFB3BEC68209D846A066601B819A405746606705C7C3086CD946A066
            601B42D80C3423B04D414A0556D80CC29941A7EC00E2EB4FA526F081EE7BE86C
            3C5BE43AF081E2D3464DC652F0F165E08B01FCA8EF3046FC71FC8EBBEE7DE03F
            391398A31D810963C653BC25F40D60E6E094B4E9B2E760465E9E6C6B0D13A8AA
            ABA5FA166302C70ABB0BF830EC36F0D1618F001F86DD057C27D8BDD97C500783
            0F2D5FB690D672E49F963E8DFE04F82FBB4A76F3199A388A86C427357DFD1BDF
            F85FFEA80130320018800A46D09519D88670346670AC59811A826D062E43D0AC
            209C19A8191C6D66E09B818A2F3FDF10587ADD85CD00D7A5CE35E01F7BFF1C3B
            1BCF745987447DFEA06DF075B9280E85DE061F5348B1EA0CD34A3F85DF77CD4D
            377F7658E2A879A3BC0EC1E1A3C7591A2BA501260E6136E1B48C4C31813C3681
            526402B535D4C026309B4D20003DC36E0FD501F400F45D801F88F21EF047037E
            FB623EB3C2D047035F805F8A686FB48C05F8D7AD5D4A69D3D3E8C22BAEA1DF5D
            76255D7DF3ED48F911F9E77EF6739F07FC80146718802A6C046A02B611B8CA03
            DB046C1D6D560003D073382B389ACC404D40CF2E23B00D418D206C086A0A3002
            E937E0B36D0661234016806BD5798D1FAD9C8D67AAC2077F88023F7F90F2617A
            C287EC8AF8E8D8C1C41080AF5FAA7EF11FFDD18F7FF6F9210923E78E99345586
            06E3B8CEB59538964D60F2549A342DCD3781FC92123681999C09D450E32C3601
            8EFEE1481F86BD5BE0559D80FF8069BD15E915781B7CD586F5CB293B2F4B3AFB
            90F65F75D36DC49F0BC5258D5ECCF023ED07C8FFC78201A8BEC13A56335043E8
            CE0CECAC002610CE0AD4086C43086704613350237099812B2B081B02E00F1B42
            B4ECC0EF4484F83AD4EB13D7AAF40BF099DFF6FE5876369E89F20E89F8F8C0F0
            E159C2E789C3061F0A80CF3FAAE0E30B55F8F1C5E3A2F8A78B2FBBEC3F39CAB5
            8F9B9C2CE5C0B091637CC58D18C3E5C1041A33698A2C2E9A9699499930816293
            09C0049A6735D3DCF941D815781B7C1DAAF361EF0278813C047D34E0F50C29EC
            9AD647035EC4517FD932037F756D255D79E3ADF49B4BAE9035FD83E39368C4D8
            097B7E72DECF2FE0CF08407E8B0503F8A67756338009E8590DC136019C6100D1
            4A041840572542D80CECECC09519A819A85C660003E82A335033D0EBC5360295
            5E57B611A819C000E4CCD79FDF67E05DA372E0FAFDE847E10DEFAF43D0D978A6
            287CF0E72533B020851F9FA1A740C4E70F148A063E842F59BF785C04B8403E76
            E5B5D77F8B61DF8A39021811189A349A8631FC43478C16A18F00B308B1A43855
            4DC02B07AAEBEBA865768B447E85DD56B4281F15FC905CD0FBB2237D77D033EC
            46009FB57C216DDAB8821A9B6BA5D6FFCD9FAEA0CBAFBB89060C4BA0A4B1130F
            5CF6E7AB2EE5CF06707E87050350C10454AEACC0CE0C60007A8609A8D408F41C
            2E138EC6088E35338001E819DFBD6D02B611A80984CD40651B81660451CD80AF
            453101EF3A959200C1CBBB9EF92D6698FA58E46C3C13E41D1AF105762F5DE2CF
            CD3F147C81DFFB80F1416B2A162DEA430A3EA417042E928F5F7DDD0DDFE39477
            C9E8095368F8A871342469146BB4771E45C347B3092013F0CB815CC904CA2A67
            524D43AD6C8BD515F061D85DC087610F000FD8F9AC51DE15E9A3C2CE5ACEC043
            2B3C6D44E4AFA9A0EB6FBB837E75D1A572E79E41C3932871CC84EDBFBFE862C0
            0F10013F843240E53203CD0AECCCC036023501959D1184B382EE4A0435019721
            749715A819D8466067062E43B0AF9FEECC209C19F8B30EF95A5513E0CB39B2C5
            19BF276600107F1888F602BF07BD9A0037CB1188FA1EF836FCF8C0A3457E7C79
            1AFD6DF8D50070C17CEAE7E7FFEA2BC39246B7619E00460306711D3C387194AF
            E1A3C6D2A889936942CA344A999E413372D9043813C03EF8B56C02C80460021F
            34CA7702DF8BF251815785C057E86DF0572C5F2491BFBA66265DC9D0FFFAE2CB
            65C86F405C028D183769D76FFF70E185FC5900C4EFB1BEEB498DC03684A33502
            3D878D002610CD0C60027A5643081B819D15A811C004542E33381A23089B812B
            33D0EB4A0D41AF37DB08C404706DE21AE56BD63600D9FC948F9801F067E1036F
            838F0F079F101F3EF8FC4142023F7F70DAE1A251DF05BF7E612EF8F562D08B03
            17CDA77FF8939F7E65D888D10BD0F9071318183F428C001AC842DFC0C8099368
            42720A9BC00CCA60132880095456505D438D6402D82D47A7DB1E4DA4F76187EC
            B4BE3BE88F127868E50A73DEBC71253534D6D0D537DD46BFFAE3A532BFBFCFE0
            381A397EF2D3E7FFFA3717F3670020BF6F0946609B811A822B2B50238000BE6D
            066123701942B4CCC036023B33E8CA0C6C43381633B08D40CD404DC03683B009
            A8018809F0350A753200BEB6057E3E611141CC00F8C3F07B4521FE907028FC38
            B0A793C21F065FA3BEC26FBBB11A80C2EF32005C087A61E042C1C5F32FE79DFF
            CBAFC58D1CB370FCD46932416800A7C6031346B019F099C5064123264CA4F1C9
            C9920964E4E5444CA0B1965AE7B41C1BF81EF4C73BD22BF8AA4D1B96D3AC5975
            52F3037EACEEEB3570081644BDF6A7CBAFB89EFF7640F743D60F3C858D206C02
            D1B202DB086C13C059CB83705680B39A806D0430009CD5045C46E03203350135
            02FD8ED5047056138866046A067AFDD866A0C145CD20AA01F035AC06205B9FA3
            03901F4BB6CBC7D96B000A3E7F1892FE5BC2362D005FE0E70F49C657596A000A
            BF2BED77C1AF6E1E865F2F045C18B85070E1E002FAD7EF7EFF87DF881F356E03
            16096124A0FFF0441AC0F0C30C20740E268D9F40E3A7A650F20C2F1328B64D60
            5627E8BB8AF40ABBADA307DEC01E06DED666AEF997B4CFA5DBEEBD9F2EB8F012
            99E2FBE480C180FFAFB7DE75EF23FC370340C0FF23EF0C03089B816603614308
            1B4138335053503350438896196856A099819A811A821A011EDB6680EFCE3684
            7046609B4158DD99815E432E23F03301BE5E3FC592ADCCF832B6E1D7E88F93C2
            2F878B8DAEE46C3C1D85E86F19801CFCC129FC61F08F157EDB00201B7E3DE38B
            C705611B00840BE85FAEBCEE86F312468F5F3B31395552FF7EC312B8564EA2FE
            7189A2C149A368C4F889A61C6013C8CCCDA142CE046656CFA486A63A9A3BAF95
            C1C7861A0AFE027E1CE9B1D7281F88EEB63CE0D1630F45A08F0EFB2A4FE671BB
            3CDECC91BF7DD11CD9C1E7E7BFBFD8C0DF7F301645BD7AEB5DF7F4E0BF1590FD
            D8124C40659B40D80C6C53089B010CC036041880CB08201840B41201FFB66846
            A0B233037C77B619E0AC0A1B814A4D4083822A6C086123F04D80AFD7CFB06000
            9FE4CBD8053F5FEEFF28E93FBFFF7D477FC8D978BA89D32057BD7F3491DF95FA
            87D37E57F487C219807EF10ABF5E287A11FDFB77BEF7C36FC68D1CBB005B890D
            4E1C497D87C653BFB804310308230423C67139C09900FA0432BD3E0198406373
            3DCD9BDF2AF087D3FAE8511E0A46FAAED27A1B7AD5EA95EDBE366F5C4E8B16B6
            D29DF73D20F0FFE1B2ABA8E78021347A52F2B337DC7AC703FC3702BC9F7AFA09
            CB3602154C40153602DB046C23889619D81941B4AC205C2240DD650561235033
            50E9771B2D2B5023B0AF0B3501DB00D404D400147E447E855FEF75F0FFF8FAF6
            E1E7C3865F0E171BDDC9D978BA097510CE609E85833F3F033EC49F8D1AC0B1C2
            AF671B7EFDE26CF8F58BC6176F1B80C20FE162FA8FEFFFE8C7FF3B7CD4B84598
            2780D4BFCF90E16204AA41092364AEC0B8C953696A7A3A65E4647339504495D5
            959C09D44B26B084B380607477C37E34C0DBD0DBB0ABD6AC8AC0DFB1642EDDF5
            E04374DE6F2FA2DF5DFA67D9B71FF74D78AC579F69FCB7E1EF06F43FF3A44610
            CD0CC29981CB10BA33836846103603CD0A5C99819A80EA58CC404DC036049711
            D8866067026A00FFC2D7A91FF9F9FAB5E1FF27865DE007F9809FDB7CF871DDE3
            B1CDC3B1C8D978BAC961007EEA0FF10714861FE768F0874D4053333581EEE0B7
            0DC036015C40B8A83EFFCDEF7CE7FFD804A4631026F0D4E038EAC3F0F76633E8
            3378380D8A87098CA3B16C02C969C604B41C68E47260DEBC590C239B8000DF19
            FC08F4EF0F7C406F6BD386656C34F3E9FE471FA35FFCEE62FAD51F2FA3014386
            D1ECD656FE779551E2D849476EBFFBFE7EFCB7014200AF06A0671880CA650476
            56A04600037019819A415719816D06B61140AEAC002670346610CD08D40CD404
            A219815E2F0103E06B540D00F07F8A65C3AF51DF14FC5CD6F2CFD891DF3782F7
            2367E3E9268701F8A93FC49F8FC26F477F055FE157F0BB4BFF8F25FADBF0E302
            C285840BEBF3DFFAEEF7BE193F7AC2726C268A3E815E8386516F86BF379B0184
            11023181295329853301940345A5C59C09B009B47039D0365BD2FEA38DF40AFB
            D1006F6BF3C665F2330FF6E8413FE3C88F1EFF3E030651735313353434505363
            239B4029254D98F2B7DBEEBE6F20FF6D000CE09FE79D6DD91941D8105C19819A
            811A81CA36826859811A425759812DDB0C546123D08CC0360397214433023B0B
            F80FBE36FF9DF5AFAC7FE66BF6332CC08FE8FF7166FD63ACFF07F0F9FA96E16B
            FE19C0DFE908F3702C72369E6E8231EA993F283D7C0360850DC0EEF48B96FEBB
            22BFC20F29F861F86D0350F8C306800BEDF37FBCF4F20B92C64DDA31994D00F5
            7FCF0143251B784ACC804D200126C0E5009BC0B41933282B9F4DA0AC84AA6AAB
            A8994D60E1C239023D00EF0EFCD5D05182BF7635B498E15F41EBD676508FA77A
            D3CF7E63E07FBC576FAAAAACA2BABA3A5F4D8D0D6C4EE53472E2D4BFDD7AD7BD
            FDF86F036C6A022A9711D86670344680733423889619749715D8A5816D04B619
            A811A8197465046A02906D026A009FE5EB11F023F22BFC3EF82C055F527E5CC7
            FC3300BF13FC610EDE8F9C8DA79BF84394DE7FFEBC747EBF9D09C000EC093F61
            0308C36F1B40B4C8AFD1DF865F0D405341DB006CF8F5A2C2C5F69F3F39EF173F
            8D1F3DBE7D424A1A0D189E484FF61F2206D06B206BD050694B1C3B8EC64F6513
            983E9DB2F272A9B8AC5816DDCC6A6DA4F645F368A505FEFB89F2801D5AB76689
            008FE5BC9B37ADA20DEB96D3937DFAD24F7F7B21FD9AD3FE277AF7A5222C5E2A
            2DA5F2F272AAAEAE8E98006704A5153369E484A97FBBFD9EFB07F1DF06E07E6E
            C965042E338009E8D936033504CD08ECCC408DC036049719B80CC165066A08EF
            C70CEC6C4033015C1B9FE76BF0732C89FC7C6DFE0B0BF023EDFF045FB788FAFF
            C4D7B0C0CF8F91B92AFC48F33F70879F4BCEC6D351FCA1DA9380646E340C80A5
            59004CC06500AED45FE1D7B3C2AF671B7E3D1F0DFCB609E002C385F69FDFF9FE
            0FBF1F3F66C2E2B153A7C990E0136C023D070E958C00679800CA01740CA6A4B3
            09E4E6483950E39BC05C5AC52670B4C0AB047C0BFA756B9789366F5A4D9B37AF
            A23E0307D1CF7E7D912CEE79BC571FCACDCBA7FC82422A2C2AA2B23263000D0D
            F5D4D2DC2C6A6D69A192F20AC9046E89640280FE179E6C235033D073D8088E26
            33E8CA08D4046C235013B08D40B30297196856A066A026A046607FAF6113B00D
            E00B7CED29FCFFC6D7E4BFB290F24B871F5FAB1FE36B17F0BBA2FE8702BECAD9
            783A4A0FCF04C2F3FEFD2C80A5F3FDA36500AEF4FF5832001B7E3500DB0470F1
            E0625203C0C5F6DF5FFAF257BE9F307642FB8469E93239A847BF41F4E4802192
            11E0DC7F58826C2E3266D2649A9A96261D8362027555D4AA26C091DF05BA2A12
            E983C043EB39DA439B3703FE35D477F06093F65F7C195D77EB9D34282E9E1E79
            B217DD71DF83B2AF1F74D7838FD0137DFA51D2E8319491954D556C08F3E7CE35
            99C0A4E4B7F9BDE8130078005F0D209C11A801D852137099816D04DD9941B84C
            7019829D11A821D846A066601B82CB0C207CCF9A0108FC7CADFD274BE0E7EB10
            F023F24BBDCFD728223FE097A8CF6D51C1C7E1BAEE3FA89C8DA7ABF890BE0098
            004BCA01CF08C4045847B3E0279CFE037C855F0D200C3FC0D70C0006102D0350
            F821851FC245F7DFDFFEEEF77F90307662C7C4D4E9D209F8589F819C0D0C1633
            C0B9DFB078D9475F4C20358D3273B3A51CA8ADAB3426D03E87A37FC404D67AD0
            DBA9BD0DFBFAF538AFE0B3D1E62D6B69EBB675D2C3FF935F5D48BFE5C88FE13E
            6CECF16B3602F401600400E500CED02FB9ED820BFF44BFBDE472BAF9AE7B69F0
            F07836822AAAAAADA3B15353FF76EBDDF70EE0BF0D606916606703DD9941B4AC
            C036033DAB11B8CC205A76A026606707B611843303DB08F47B5403D02C00DF39
            BE7FC02F919FAF3B855F537E44FD8FF335FAB18F7EF4A318E243808A9AEEE308
            5FEBC74BCEC6D3557AF0072CA58065026A0090ACF98709B05C26E0320057E48F
            66001A016CF85DD1DFCE007091E1A2FBF2CFCEFFE50523264CD931657A866702
            03C4001EEF3B48CE3081B891A369CCC449949C962A33064BD804B41C58CC2600
            F805F870A45FE7C10FF03DE8D76F58C95A455BB7AC630358C7000FE7C87F21A7
            FD97D3EF2EF9B31800CE2803D00623807E73F1E5D286D77E7FE995F2BE5F5E74
            09FDE20F17D39537DE4263F9DF877B214C4A9DF177CE04D02700E000FEF9DEB9
            3B23081B42343388561ED846A026D09511E8399C19848D400D0067DB00FCE8CF
            D7950D3FEA7DA4FCD2D9C797E227F8BA04FC32B6CF6DA8F54F68D4B7E56C3CDD
            C5877C90FCE14A39C01FB65937C9073E70969800CBDFED87A526606701610350
            F8710EA7FE5DD5FE0ABF6D0061F835127DF9FC5FFDE6F789E326AF9A9C9A21C0
            3FFAD4003680819211C0083079286EC428CF04D2288B338192B212AAADAFA639
            739A6969475B30D20BF41AE957D206065EB4718D680B83BF75DB064EFB87D04F
            013FC3FDBB4BAEA05F33F080FAFC0B19ECDF5F2C3AFF0F7F92F9FF88FC280FD4
            287E7FD99532331066800CE17CCE0A6EB9FB3ED9327DCAF4ACBFDD7ECF035A0E
            C0005C0A9B02E07765075D1941382B5043706504B619A811D88610CE08D40C6C
            1380047EBE7EBECCFA124BE0E76BEBB32CE9ECE3CBEE33AC4F79E04B471FB763
            6E8AC2DF29EABBAEEB0F43CEC6D35DDE211F287F19920578262046C01FBE9403
            2CCCAF5613C08A2BBB14B0B380B00140D1E0B70D404D40C177C1AF0600E1C2C3
            05F8B5FFF9E6B77E1A3F66D2128EA00C7C1C3DDCAB9F18C0A3BD07C819CB6E91
            098CE57200F304B2F3F2B8F62E9365C473E7CDA2E5CB1731EC0C3E223C438F28
            BF7EC36A067E356DDCB896B546CE9B18FE3D7B77D0C494A9023FD27C44F60B10
            CD6DE8F9B940CFC0E3F5DF2AF45C1E5C78F9D574E11557CB2DBFB017E045D80C
            943302FC2CDA31ED79527AE6DF6EBBE7FEBEFCB70138008F2DC220970944CB0A
            341BB08D401F87CD408D00B2B3023584EE8C40BF0B3503FDAE6C03C0F7FA55BE
            6E7CF8F97AFA3C0BF06BBDFF69BEE43E09F839DDC7F5A6E0DB297FE0705DD31F
            969C8D6782C2077FF030013B1B0898000BB3AFC40458E152C09505680610AEFB
            D500A2A5FE0A7FD8003403807031FECF7F7FF5AB3F4D183B71313A0611F51FEA
            D9570CE091A7FACB19730586A11C6013486613C8CACFA392F25236813A9ADB36
            9B96ADE0FA9FC137B07BDAC4F0439B19FECD0CFF9E1D949699299063371FA4F7
            88DE01E825D27BD0738447A407F4001DCB802FBEEA5ABAE4AAEBE8D26BAEA7CB
            AEB981AEB8EE26D91508F0C350904D609AF3C4B48CBF5C7EF575F7F3DF06E87E
            C5FA254B8DC0368370361056D814D40C54E1AC40152E118EC60CD400340350F8
            FF87AF93AFB110FDBFC4D7CE7FB2FC7A9FAFAF7F6621EA23E597B17D7E5F18FE
            C0E1BA8E3F6C391BCF24850EE9146427C6364AFCD0DFF65BCA01966CF7CD8211
            603556B8145003D012C095FADBD15FD37F85BFBBF45F2F3A5C80B830BFF18DFF
            FBE6CF12C74FEE9894864C60383DF8641F3100916502A36102DE3C81D299E554
            DFD420BB0B2F5FD1C1E93E83CFB02BF8F258E0DF4965951592D263710F52FF0B
            D804003EA04709E0D7F91AEDBD488FFBFB610310EC0074E9B537D065D7DE28FB
            00FEF9FA9B45D7DF7E17DD70C73DF27E9411B27660D4381A979CB6EFAB5FFFC6
            45FCB701541880CA6504D1CC206C00B6F07BF51C36022D0B54B611007E2D13D4
            04D408D400F09D29FC7EE4E7EB0529BF5DEF7F86AF2F89FA809F9F630E4AD4A8
            EFBA6E4F949C8D679ABC4346087086F84B914C80BF203801265EA811F826C082
            096081869A40380BB04B003BF50F477FCD00007E34F8D50070D1D917E3FF7EF1
            BFBFFCF39113A76E9A3A235322A96D02C804600CD858043B0E27A74FA7EC8202
            2AAF9C490DCD8D346FE13C5ABE7229C3BF8ED3FDF51CF5595B36D0CEDDDBA9BD
            63B1808BC53D88FC76B4D7CEBD60B4BF56EEEF879B7D5CCA915EA1BFC2831EBB
            016377A06B6EBE9DAEBBF50EBAF3FE87E9C63BEF65E3B89A2EE08C0286307546
            360D1C9E887B020240C0AE9940D80454D18CA03B43D06CC03602DB10C24680CF
            DACE08147E7C2F1AFDBFC1D782C2FFDF7C7D7C9105F8EDA8FF69BEA4FCA8CF3F
            73CAA4FB2E391BCF4459877E0938F3F71634027EAA65018C002680699A30012C
            D6D0720026A06540380B5003B0537F3BF24336FC2A85DF36015C90B840BFF1EB
            DFFDE192519392374F9D91258B86D404D03760CA013681916368F4E429943223
            83728B0AA9ACAA921A5A9A69FEC2365AB17A056DDABA91366FDB44DB766EA5ED
            3BB7D1634FF5A51F5DF05B33B4E7F5EA037A447B85DE8EF69732F806FA1B197A
            13EDB11720F6FEBF8675ED2D00FF4EB9051874C77D0FD17D0F3F4637DC76B718
            CAF99C653CC6FFD6948CDC77AFBCF686C7F8EF0288BF66A901C00C20801FCD14
            007ED814D408C286A06610368568661036004DFF25F5E7EFFFEBACAFF0F500F8
            91F2A3DE07FCE8E803F812F53DF091EE471DDA735DA32743CEC63355510E3102
            FE62C346A026806C002680F15B3101161671201B402610EE08D4FADF55FBDBD1
            5F4D40A37FB40C402FCE6F7DED1BFFFBAB847193974C4E3726F040281330E5C0
            181A3B39995233B328A7A898CA6B70D3915934BF7D11AD5ABB9AB66CDB427BF7
            EFA1A2F232FAC92F7F2791193DF9BFE7488F687FD1E541E825C5E7687F39832F
            B5BD07BD467B03FD1D743D837F03A7FD37DE7137DD74E73DA23BEF7F881E7CEC
            0931010C0D62BE004A825193A7D18889C96BFEE9631F03C4801A26A0F0ABD400
            5C46601B806D04613370650610C05723B0CB0335001F7EFE9EFF8F85C8FF35FE
            FEBFCCD2A82F1D7D7CAD00FE4F7159293DFCFCBEA8515FAFC1F0757932E56C3C
            D3E538D4A1F93B3DD7ACBD34F3B1B11C13D26C002680595CE8DDC5620E4CED0C
            F707B8B28070DD6F67000ABEC26F1B806600B84071B17EEBCB5FFDFAF989E3A7
            2C9BC2A934807FE089DE5626D05F8C01B5366E4A3A2D339B728B4BA9A2A6961A
            67B7D28225EDB476E33ADAB17B07DDF3C8E3F4E35FFE5E86EC0025D27B819EA5
            D0DB29BE447A2BC5BFF61686FEB608F410260261E8EFB67BEE17DDFDC0C3F468
            CFA7E891277AD1DD0F3DCA59C5555C6E5C480F73E6919C99F7EE95D7DDF8B8F7
            B7FD8605135023701902C00F9B811A881A826D065D1901E0D7B39D0568F4FF2E
            7FAF0ABF74F6F1F7AD51FF737C3DFC3B4B86F7F83A41D4971D7BF8E74E89A1BD
            6391B3F16C5094434C00E283BF5FF10235027FA4800523B04D002BBCEC510135
            817016601B80C21F8EFC61F8D500205CB0DFFDD297BF7241D284291D53A66732
            F071C18E41164C00F7251C3B2585A665B00914955079750D35B1092C5DB592AA
            1A1AA4E6FFF9EFFF28911FC0FFE96A13ED2F03F01EF4E8C947E406F80ABDA4F8
            D2C11789F4B7DC751FDD2AD03F20538511F9A1BB3155B8773FEA01F5EA23D902
            3A1C2FBDE6469AC4594CBF61F1C5FCF70044006F9B802DDB046C03081B816D00
            B61144330335001B7E7C07F82EBEC5DFA7C0CFDFF157590ABF46FD7FE6EBE2D3
            1CF53195D706FFB488FAB69C8D67931C873A37BE48594DC85F32166960E69664
            032C3501CCEE42AF2F7A7F610258F1E53201ED07D02C00D15FD37F3BF24361F8
            214429152EDCEF7EE92B5FB960E4A4E4B55333736433113B13788433813E43E2
            E59E8463D80452D804728A3813A8ADA3851D1D34246904D7FEBF93DE7981BE8B
            CE3C85DE44FABB04F89BEFE448AFD0DF6BA087EEE2888FF501F770B4BF97D37E
            A4FEBDFA0DA03EFD0753AFBEFDE9FE471E93A1440C37C68D1ECF65C0D4E5FCB7
            0064800E03F8AD7756F8C3A6601B41D8106C337099826D04F80C6D03C0E7FD7D
            FEEEBEC302FCFFCBDF6720E5E7EFFC3F5876D4C7DC11855FC1F7E1D76B2B7CBD
            9D6A72369EAD0A1D6A02388B11F085806C000B37D0C38BB2403A085930024CFC
            40DF00167E44CB04EC2C206C001AFDC319801DFD558860DFB9E037BFBB626C72
            FAD3299979027CB01CC0E840BC6402E3A6A21CC8A1FCF2991CFD1BE956861506
            808EB940671EC0BF11D06B675EB0AE478A7FAB97E2DFEE816F22FDC312EDEF65
            F0EFE3D2E281471FE7DABF079F7BC88AC201438753EF0183E92936834B38D3F8
            F9EF2E927FEBD419B9CFFEFB673FFB27FE5B0033E05703B0D59D1184651B81CB
            0034FA6BEA8FCFF97BFC9D01FE6FB2BEC1DF23A2BE3DB6FF6FFC9DFF33477C99
            CDC7CFB196C4AEF5057A3D5CD7D6A92A67E3D9AC28876403105F20BE11C00458
            58D8A1462065010BA9A264032CCC1043C7A09D09681660F701A80984E1D7C80F
            F03572E122C6C5FCBD6F7DF7FB177339B02C392B9753FFC810E1C32C3101CE0E
            E2500EB009CCC82F24CC27F8E395D7D14F7F7DA1D4FD57DF7C5BA8AEE7F4DE86
            DE8BF661E811ED013DA23D22FDFD027E0F7AE8F127584F72DDDF931EEED193E1
            8FA36109493470589C2C32C2EFFFD9AFFF4037F2EF4CC9CEFFFBC597FFF941FE
            3B00A91A40D808C2A6601B816D066153081B010CC04EFDF1F9FE80BF1BC0FF6D
            FEBE10F5BFCE42D497197DFCBD22EAFF2B438F741F591FC047C40FF7F0FB87EB
            9A3A95E56C8C296004FA05E30C8919F0452346C01707E676232340FF807612A2
            2CC0F010A207A2C8173D1340C76038135013B00DC08EFCD1E08770517FEF2B5F
            FBFA6F92264C5DE66702A1214293098CA7C9E919B2DFC02F3905FFF9EFFE2869
            BF19B243A467718A7FE39D770BF48148CF8A0EFDE3F4D06380FE0901FED1277B
            D1633D9FA2C77AF5A6C7F93C2C3E49960BC7B109C008EE79F051369F3FD035B7
            DE4593A667E3770EF1FEA6DFB37EC702F07A0ECB3681F0D9650430003BFAE3F3
            C3E7A9F0A3B32F1CF5A5879FBF4F89FA2C2CE071A5FB01F071B8AEA3535DCEC6
            988CA21C012360C9DC01BE48FCFE0156A76C80854522C806EC7E01F409687F80
            9D0584330035004DFFD504706123BAFDE8739FFFC26FD90496A664E573D44FB0
            CA8148263062C2147AB8675FFA05C38FA9BE57DD74AB44F9408A2F9D79F7FB75
            BD827FCF439CE25B911E29BE811ED1BE970F7E8FA7FAD013A2BED4B34F3F1AC1
            F08F193F9192468D91C70F73660003B8824B8EF1A933E8915E7D46F1BF1F7F17
            0C404D209A01A8D408147E358230FCE1C88FCFF287FC1D48D467FD1F7F2F76D4
            F77BF811F5595824A6E9BE6480AC33067EC8D918536759877EF9B609A016D4B2
            001B3CA077189143B3017412221B4074916C8085D964C8066002E14C209A01A8
            6CF8215CEC3FFAD257BEFABB119392574CCB2E1013B0270BE1DC7F7812DDF5D0
            E312FD31268F5AFFD6BBEF77D6F5AE68FFA095E2DBD11EFB040AF8BD0DF4E8F0
            83FA0D1A42E3274FA10993A7D2583681B11326CA6800161D5D7AED4D342E653A
            3DF654BF31FC6FB70D202CDB0CECC72E13D04CC08EFE1AF97FCC9FB7447DFE0E
            BEC5D28E3E8DFA48F7FDA8CFCF15FC70D40FC0EFBA564E27391B6372CB71E805
            818B239C114859E019818E16A02C906C8025D98067025A126826D05516108EFE
            38E362C745FFE36F7DE77B978C4D4EDF352DA730D02700F5E837986EBBFF117F
            851F52FF3B35D2FBE003FA4702757DE768CFD05BD1FEC9DEFD7CF07BF71F28BB
            06E33C2C2191A6A54DA72929D368229BC0A429C9F2333FFED5EFE9CF37DC4A13
            D332E9C1C77B26F2BF1B7F970B7E5BE1CC008FC32610861F9F153E37C08F5E7E
            D4FA1AF531A30F3DFCA8F5FFDD03FFD3F8CEF87DE1A1BD00F87A2D84AF8FD351
            CEC698BA967EF9D6611B819F11E042E20B4A33025C5C982B1E36026C202146C0
            C28C3364039A096887204C209A016806800B1F00FCE8473FFBF935A3A7A6ADD7
            4C40CB012C23BEFD814765EAEF799C0560061F7AEE25C5E7DAFCDE87187A06FE
            01447BAFAE37D11E91BE1743CF75BD17ED9FE468DF8BA17FAAEF00E9DDEF3380
            C11F3888FA73D4EF3F780847FFC1346EC224CAC8CAA169E9D369EAB4544A494D
            93CCE14717FC86AEBBFD6E7402BE7BE3ED773DC5FF66FC2D2EE85DB24D403381
            30FC12F5F9B3D4A8FF3DFE9C11F531AEAFE0FB437B1FFDE84715FC70EF3EBECF
            C011BE164E77391B633A7A850EA711F0C5A64680F16331026E0B94052C940558
            5E8A99675A12D8D9809D09C004A21900F493AF7CEDEB178D9C94B20C99809A00
            0C00674CFE411DFEE7EB6F91086F0FDD3DDC2318E91FF3A0474D6F223DD27B85
            7E10F565E891EA03FA014386D2A0A171A2A1C3E329233B877272F369466616A5
            4D9F41D36764481FC30FCEFF0DDD72EF43949657FCC68FCFFBC58DDEBFDD057B
            585DC18FCF009F05E0FF297F863F62C9D83E7FB6815A9F3F7FD4FAFFC6E04BBA
            CFEFC1CE505D76F2B9BEFB3341CEC6988E4D7A81848E681901568AA1A3104680
            89256A04325A808B94DF876C008B4F74AE40D804C2FD00610300143FFDDCE7BF
            F087C48953974FCB0D9A00EA6F180016FC98F41E51DE0CDD490F7E20BD8FD4F5
            11E8074B840F433F246E38839F4083870DA729C929B243707E4111E5E4E55376
            6E2EA5A6A5D3C57FBE46FEDF8FF71F4293A667EDE0BF1F6003E430ECB6C2E97F
            34F8CFE3CFEC272C74F469ADEFF7F0F3FF4BA23E7FFE88FAD8A507BB40B9A2FE
            59013FE46C8CE9FDCB71B88C40261221FAB0702162C4C036024C3DC5458B6C00
            5352B56F408708D504EC4C0006A0260030A09F7DE9CB5FBE70C4C4E4E5C804FA
            C525492970C39DF7C91260F40360E61E22BC76E6D93DF80ABDD6F5001F29FE80
            C14369E09061023D6047B407F8715CF3E3F1C83163A862662595B38A4B4AA9A0
            A8984ACACA2871E4683AFFF77F924EC85153A651E2F8C9F3BD7F338076810F29
            F8003E0C3E7E56A23E7F4676D4D7717D9DC32F519F3F6B447D051F515FC187CE
            2AF055CEC6983E98A21C6123908D49F9624446202306AC7F65A17FC02F0B58B8
            88A56F80658F12201BB04D0051D0CE0400096039EF3FFEE373178E9E9ABA8953
            6EEA1B9748773FF2842CFF456FFCD537DE2AA09B149FEB7A7E6C77E6B9A23DA0
            D7683F2C3E91862724D1F0C4248A4F1CC14AA2A2E2126A6868A299555554C659
            40697939955754D0DD0F3E4ADFFFC5AFE9EA5BEE2418D2137D074EE57F1F4A1A
            9701B8223E84BF4DA33EFE6E447DEDE443BAFF4D965FEBF3E7F979FE7CB5930F
            BDFB76BAEF041F87EB7B3D13E56C8CE9F82974E042EB64047C51FA23067C91C2
            0874FE80D308F867B46F40B30135013582B009FCE427E7FDE28631C969DB92B3
            F2A9DFB044BA9CEB7FA4E2BFBCE8327AF8F12724E26B8A0FF975BD46FB610CBE
            401FCFD09B682FD0278DA0C41123298105F8B37272A975F61CAA6F6CA29ABA3A
            AAACAAA6BA867A4A4E4D93D1879FFCEAF73438690C0CE0D51FFFF4E737F0BF0D
            A50C60B7C15729F490467D44FC5FF0E780BF59D27DFE5C90EE03FCC0841E9829
            7F9E32930F9F2FBF5F67F2E1733FEBD27D979C8D311D5FE9613FE6A39311B064
            0F02CF08C22306BE11F0452FFD032C2D0BEC5182682670DE97BFF6B54B922626
            2F4BE74CA0E7C06102E48F7FF93BBAF59E0768EC8449D483CB803E1CF901BE9D
            E207A2BD077D42D2484EE94751D2A8D1620050416111B52D5C48B3E7CCA1E659
            2DD4D0D8C89940233537B7C848C3777E7681447F6422FD872516F2BF09E61586
            3F1CF1157C3BE26B9DAFBDFB0AFE7FF367F69F16F8AE3A5FA117D9DF913E3E9B
            E46C8CE9C393E35013B04B031881660430022C41B53302A4B7E8D546FF0066B4
            614AAB1A8176106ABF806D023FFBAF2F7EE9A2111393574C2F28A53B1F7A9C7E
            C029F92FFF7819E573ADBE70D122A9D37BF71F40FD38F51F12172F913E2E3151
            A27B02A2FD28037D12C38F941FE7D4F4E9D4D8D4444B97ADA045EDED346FFE7C
            3181D99C09CC6F6BA381C3E225F2A3F64F183799A666E4BEF0F56FFCDF95FCEF
            01D436F87AB6C1B7EB7C802F753EFFED76EFBE2CD7E5CF48EA7C059FDFA775FE
            59D7BB7FB47236C6F4E14A2F3CEBD088A466800B1617AEEC41C01733A6A5DA46
            A01D853002ED288411B8CA023B1B005CE77DE1BFBE8821C215A9B94574D5CD77
            D0F7CEFBA5CC0D58B4A483FF59EF09C018B347B41FC8753F3280384EFB87B319
            C008A0B1E3275056760ECD6A9D4D6BD7AD132D5DB69C162F5E4C0B390B58B870
            112DEDE860B3184B3FE22C034673DFE3BD08C673FF634F60FA2FCC0AC0BBA2BE
            0DBE1DF5ED997C1AF5D1C1279379BC613DACC740BA1FADCE97B3FD7D9CCD7236
            C6746214E55013C0856B1B81CC21F08C00F3D575C400F5AE8C18B0600458D60A
            50B42C80110024188166033FFBFC17FEEBC2B1C9E96B27A667D19FAEBE81BECB
            E93946066A3865C7F1EEBBEFD2CE5DBB681103DDD8D44C55D535545553C3697D
            13CD6B5B40ABD6ACA11D3B76D2F6EDDB69FD860DB49A9FAF5CB98A4D6019AD5A
            B58A962F5F4EC39346C9AC3FC08F3E072CFE891B3DBE99FFFFF837E1DFA1E02B
            FCF8F741F8B7E2DFACE023EADBE9BE4CE1E5CFC0AFF3197EBBCED7743F16F5BB
            91B331A6132BC7A1D9403823903D0AF9428711D873086446210B46808E42E91F
            60E9B0A1F60D685900F87EFCD35F9C7FCDA4F4ACBDE3A6CDA04BAEBD493281EF
            FFFC573472FC447AE5D557F99FC646F0DEBBF4FA1B6FD0912347E885175FA4E7
            9E7F9E0E1E3A447BF7ED63F877D0E6CD9B69C3C68D62021BF9BC7DDB369A3B6F
            1E3DF4442F06FF3702FF7577DC2BF08F4D495FFF852F7EF18FDEBFA5AB741F06
            A133F95C9379FC741F519F1F9FD593793E889C8D319D1C4539D40C02A5015FF0
            B611844B03310216860EC508589A11E8042244D91F7DF7873FFAF398E4B46530
            812B6EBC8D7E78FE6F381BF8255D7DF3ED5456594D2FBCF022BDFBCE3BF4D7BF
            FC854DE0653A7CF8301D6203D8BF7F3FED6313D8BB678F9CF7F079D9F2153435
            355D3613454681BAFF9E479F9421BF911393177DE9CB5FBEC4FB7F87A33EC0C7
            BF07753EC047C4C7BF3930ACC77FA33F9ECFD274DF35AC07050ED7E71D53CC00
            4E49398E7046209D852C290D4246109E4C2446C092D2807F0619813D9DF807FF
            F1B9CFFD3A71FCE4DA2919B9325B10A303DFFEE9F9AC0BE886DBEFA609535268
            CEBCF9B489A3FD564EF9B7EFD8415BB66E95BA7F31D7F925651534243E49F610
            444FFFF7CEFB95DC0BA06F5C124DCF2FA5C40993DB3EFBF9CFFF81FF5FC84400
            3E22BE467D808F7F878EE7FF80FFAD3AAC67CFDDB7C7F3A3D5F990447DFD1CC3
            9F6D4C41391B633A35A487F758D3593503ED230004726F43CB08EC3E02574680
            B45A3B0B9111203BF861AF8143472767E5BF1C3F6E32DD70D7FDB281E7B77F72
            3E7DF3C73F1753B8E88AABBDADC26F10E13E80D84A1C7713FEE68F7F41DFE512
            027BFEDDFB584F9AC8293F47FED77A0E1892C2BF1B693DFE3F76AA6F836FF7EE
            63169F76F0A1CE47BAFF59FEBB5C753EFE7E1F7A3DC29F634CD1E56C8CE9D453
            E85013D06CC0591AB0C4080011C3E4CA08C40858C8086006DFFEED45175F3972
            524A4B4A4EE1BB18B2C372E24BAEB95186F090D2A3471F3713C19E82E8E03393
            892EA5EB6EBF879E1C3094C624A703FCB713C74D6EB8F0E24B6FE6DF89AC03A0
            2BF4300305DF5FB1877F0FCBAFF3F9DF2C1B74E06F6021EA6358CF063F5CE7FB
            63FA311DBD9C8D319D9A721CB8F8C366D02923502360A06C23407A2DD38B5930
            024C2F860960BAF10FAEBAE1E63B13274C299F3C23E7E90969993472F2341A98
            3486FA0C4B947D06B0B86840C2288A1B335136F640F9303533771F9B46F56557
            5F7B27FF0EFC3E08B0FBD043FCFFC2BC7D5DAADBE5A21D5678165F187CFF707D
            6631752D67634CA7B6F4620F1D6A026A04764620138A58F684227BF8100B6730
            722066C03F0761CAF1FF7CED7FFEF7D7B7DE7DDF3D03E3474C499A30A562D4E4
            9486D153535B474F499DCD994263C2B849E5FDE312A7DC7EEF030FFFEFB7BE7D
            21FF0C162E61BD02CC0435BF6417FC7B013C84197CF6BC7D055F67F121DD57F0
            BB5AAD270610FE6C623A36391B633ABD641DE18CC02E0DE4EE460C158C20BCE8
            C8CE0A6006C80C0032F624C09665BA8F6178235308EFC38E46D8E3108F11D521
            408EBDF720F43BC05C50DF037AFC3FF0FF9288CF42C4973A9F159EBEDB29EAEB
            DF1CFE1C623A76391B633ABDA430840E00631B0104A8E45E87004D8D80A5FD04
            BADE006062B20DEA71800AC021BDB1890A6600E891C2036C156A7915604794C7
            EFC1EFC3EFC6FF032BF534E2475BAD17005F8FF0DF1FD3FB97B331A6D357A123
            9C11686920FD040C1B32021801526E9407B619A0130E8680088D0C01D062484E
            A526610B6D105EC7FB21FC2C84DF83DF299378581AF1BB02DF875FFFB6F0DF1B
            D30793B331A6D35B0A4AE8081B0140D30E43C90A184AA4DF5A2260B20D3A0F61
            0AD8271FD04298778FD20182510484D7BCF74002BA77D65D7721180EFE5F003F
            DAF45D39ECBF27A6E32F67634C678E1C87CB08FCAC8085CD3131E40638D11107
            50C518589863007811B921055A05E3C07BF48C9F81E477F0EFC3EFC4B45D1DD2
            8B56E7FB513FA60F57CEC698CE2CD987F75C00F3CE6A066A0800520D0102A430
            063107C803D8370AEBB9BCEE497F0652D8F5772AF476C4F7A1D7C3FE1B62FA70
            E46C8CE9CC56E8D088EB32033D0356CD14F4DC95F4FD90FEBCFE3E055ECF81C3
            F5EF8DE9C393B331A6B3438E438D00871A822D05F86815FE79C8FEFDFA580ED7
            BF31A60F57CEC698CE2E453914501B523C7641ED52F8E7C2BFCB3F5CFFA6984E
            8C9C8D31C5F4611DAEFF574C274FCEC6986272E9580ED7CFC774AA893EF2FF01
            4DDF925D27443DB60000000049454E44AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object Header1: TfrxHeader
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 816.000527000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Pos.')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 56.692950000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Nro. Moto')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 120.944960000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Piloto')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 464.882190000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Tiempo')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 551.811380000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Vueltas'
            '')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 279.685220000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Localidad')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 604.724800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Handucup')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 680.315400000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Recargo')
          ParentFont = False
        end
      end
    end
  end
  object posiciones1DBDS: TfrxDBDataset
    UserName = 'posiciones1DBDS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'posicion=posicion'
      'nro_moto=nro_moto'
      'categoria=categoria'
      'formated_tiempo_sec=formated_tiempo_sec'
      'nombre_piloto=nombre_piloto'
      'localidad=localidad'
      'max_nro_vuelta=max_nro_vuelta'
      'handicup=handicup'
      'recargo=recargo')
    DataSet = ZROQPosiciones1
    BCDToCurrency = False
    Left = 132
    Top = 280
  end
  object frxPDFExport: TfrxPDFExport
    ShowDialog = False
    FileName = 'C:\Users\Enrique\Documents\test.pdf'
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 216
    Top = 280
  end
  object JvReportTimer: TJvTimer
    Enabled = False
    Interval = 300000
    OnTimer = JvReportTimerTimer
    Left = 400
    Top = 232
  end
  object campeonato1DBDS: TfrxDBDataset
    UserName = 'campeonato1DBDS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'oid=oid'
      'nombre=nombre'
      'anio=anio')
    DataSet = ZCampeonato
    BCDToCurrency = False
    Left = 204
    Top = 336
  end
  object eventoDBDS: TfrxDBDataset
    UserName = 'eventoDBDS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'oid=oid'
      'nombre=nombre'
      'anio=anio')
    DataSet = ZEvento
    BCDToCurrency = False
    Left = 284
    Top = 336
  end
  object tomaTiempoDBDS: TfrxDBDataset
    UserName = 'tomaTiempoDBDS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'oid=oid'
      'nombre=nombre'
      'anio=anio')
    DataSet = ZTomaTiempoEvento
    BCDToCurrency = False
    Left = 284
    Top = 280
  end
end
