object GrillaPartida: TGrillaPartida
  Left = 0
  Top = 0
  Caption = 'Administrar Grilla de Partida'
  ClientHeight = 545
  ClientWidth = 881
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
  object topSplitter: TJvNetscapeSplitter
    Left = 0
    Top = 265
    Width = 881
    Height = 10
    Cursor = crVSplit
    Align = alTop
    MinSize = 1
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitTop = 257
    ExplicitWidth = 844
  end
  object panelOrdenCategorias: TPanel
    Left = 0
    Top = 0
    Width = 881
    Height = 265
    Align = alTop
    BorderWidth = 5
    TabOrder = 0
    object cxGridCategorias: TcxGrid
      Left = 6
      Top = 6
      Width = 673
      Height = 253
      Align = alClient
      TabOrder = 0
      object cxGridCategoriasDBTableView: TcxGridDBTableView
        OnEditValueChanged = cxGridCategoriasDBTableViewEditValueChanged
        DataController.DataSource = DSCategorias
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGridCategoriasDBTableVieworden_de_largada: TcxGridDBColumn
          Caption = 'Nro. Largada'
          DataBinding.FieldName = 'orden_de_largada'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderGlyphAlignmentHorz = taRightJustify
          Options.Sorting = False
          Width = 80
        end
        object cxGridCategoriasDBTableViewColumn1: TcxGridDBColumn
          Caption = 'Orden Largada'
          DataBinding.FieldName = 'orden_de_largada_posicion'
          Width = 80
        end
        object cxGridCategoriasDBTableViewnombre_categoria: TcxGridDBColumn
          Caption = 'Categor'#237'a'
          DataBinding.FieldName = 'categoria_oid'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'oid'
          Properties.ListColumns = <
            item
              FieldName = 'nombre'
            end>
          Properties.ListSource = DSCategoria
          Options.Editing = False
          Width = 101
        end
        object cxGridCategoriasDBTableViewtipo_de_largada: TcxGridDBColumn
          Caption = 'Tipo de Largada'
          DataBinding.FieldName = 'tipo_de_largada_oid'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'oid'
          Properties.ListColumns = <
            item
              FieldName = 'nombre'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DSTipoDeLargada
          Width = 99
        end
        object cxGridCategoriasDBTableViewcant_piloto_por_largada: TcxGridDBColumn
          Caption = 'Cant. Piloto por Largada'
          DataBinding.FieldName = 'cant_piloto_por_largada'
          Width = 134
        end
        object cxGridCategoriasDBTableViewColumn2: TcxGridDBColumn
          Caption = 'Cant. Largadas Muertas'
          DataBinding.FieldName = 'cant_posiciones_muertas'
        end
        object cxGridCategoriasDBTableViewhora_de_largada: TcxGridDBColumn
          Caption = 'Hora de Largada'
          DataBinding.FieldName = 'hora_de_largada'
          Width = 86
        end
        object cxGridCategoriasDBTableViewsegundos_entre_pilotos: TcxGridDBColumn
          Caption = 'Seg. e/Pilotos'
          DataBinding.FieldName = 'segundos_entre_pilotos'
          Width = 88
        end
      end
      object cxGridCategoriasLevel: TcxGridLevel
        GridView = cxGridCategoriasDBTableView
      end
    end
    object panelAcciones: TPanel
      Left = 679
      Top = 6
      Width = 196
      Height = 253
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        196
        253)
      object btnGeneratePilotList: TAeroButton
        AlignWithMargins = True
        Left = 6
        Top = 33
        Width = 187
        Height = 34
        ImageIndex = 0
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Caption = 'Generar Lista de Pilotos'
        TabOrder = 0
        OnClick = btnGeneratePilotListClick
      end
      object btnGenerarListaCategorias: TAeroButton
        AlignWithMargins = True
        Left = 6
        Top = 0
        Width = 187
        Height = 34
        ImageIndex = 0
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akTop, akRight]
        Caption = 'Generar Lista de Categor'#237'as'
        TabOrder = 1
        OnClick = btnGenerarListaCategoriasClick
      end
      object btnExpXLSTT: TAeroButton
        AlignWithMargins = True
        Left = 6
        Top = 178
        Width = 187
        Height = 26
        ImageIndex = 3
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Exportar Grillas'
        TabOrder = 2
        OnClick = btnExpXLSTTClick
      end
      object btnControlDePaso: TAeroButton
        AlignWithMargins = True
        Left = 6
        Top = 203
        Width = 187
        Height = 26
        ImageIndex = 3
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Control de Paso'
        TabOrder = 3
        OnClick = btnControlDePasoClick
      end
      object btnControlParque: TAeroButton
        AlignWithMargins = True
        Left = 6
        Top = 227
        Width = 187
        Height = 26
        ImageIndex = 3
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Control Parque'
        TabOrder = 4
        OnClick = btnControlParqueClick
      end
      object chkInvertirP10: TcxCheckBox
        Left = 6
        Top = 66
        Caption = 'Invertir primeros 10'
        ParentFont = False
        State = cbsChecked
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 5
        OnClick = chkInvertirP10Click
        Width = 142
      end
      object btnEliminarLista: TAeroButton
        AlignWithMargins = True
        Left = 6
        Top = 110
        Width = 187
        Height = 26
        ImageIndex = 1
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Eliminar Lista Piloto'
        TabOrder = 6
        OnClick = btnEliminarListaClick
      end
      object chkInvertirP5: TcxCheckBox
        Left = 6
        Top = 82
        Caption = 'Invertir primeros 5'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 7
        OnClick = chkInvertirP5Click
        Width = 142
      end
    end
  end
  object panelPilotos: TPanel
    Left = 0
    Top = 275
    Width = 881
    Height = 233
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object panelAccionesPiloto: TPanel
      Left = 725
      Top = 5
      Width = 151
      Height = 223
      Align = alRight
      TabOrder = 0
      DesignSize = (
        151
        223)
      object btnChangeStatus: TAeroButton
        AlignWithMargins = True
        Left = 6
        Top = 8
        Width = 139
        Height = 35
        ImageIndex = 0
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akTop, akRight]
        Caption = 'Cambiar Estado'
        TabOrder = 0
        OnClick = btnChangeStatusClick
      end
    end
    object panelGrillaPilotos: TPanel
      Left = 5
      Top = 5
      Width = 720
      Height = 223
      Align = alClient
      TabOrder = 1
      object cxGridPilotos: TcxGrid
        Left = 1
        Top = 1
        Width = 718
        Height = 221
        Align = alClient
        TabOrder = 0
        object cxGridPilotosDBTableView: TcxGridDBTableView
          DataController.DataSource = DSPilotos
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxGridPilotosDBTableViewColumn1: TcxGridDBColumn
            Caption = 'Orden'
            DataBinding.FieldName = 'orden'
            SortIndex = 0
            SortOrder = soAscending
          end
          object cxGridPilotosDBTableViewnro_moto: TcxGridDBColumn
            Caption = 'Nro. Moto'
            DataBinding.FieldName = 'nro_moto'
            Options.Editing = False
            Width = 109
          end
          object cxGridPilotosDBTableViewnombre_piloto: TcxGridDBColumn
            Caption = 'Piloto'
            DataBinding.FieldName = 'piloto_oid'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                FieldName = 'nombre'
              end>
            Properties.ListSource = DSFilterPiloto
            Options.Editing = False
            Width = 279
          end
          object cxGridPilotosDBTableViewnombre_categoria: TcxGridDBColumn
            Caption = 'Categor'#237'a'
            DataBinding.FieldName = 'categoria_oid'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                FieldName = 'nombre'
              end>
            Properties.ListSource = DSCategoria
            Options.Editing = False
            Width = 183
          end
          object cxGridPilotosDBTableViewestado_piloto: TcxGridDBColumn
            Caption = 'Estado'
            DataBinding.FieldName = 'estado_piloto_partida'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                FieldName = 'nombre'
              end>
            Properties.ListSource = DSGrillaPartidaEstado
            Options.Editing = False
            Width = 96
          end
        end
        object cxGridPilotosLevel: TcxGridLevel
          GridView = cxGridPilotosDBTableView
        end
      end
    end
  end
  object buttonPanel: TPanel
    Left = 0
    Top = 508
    Width = 881
    Height = 37
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      881
      37)
    object btnAccept: TAeroButton
      AlignWithMargins = True
      Left = 779
      Top = 1
      Width = 100
      Height = 35
      ImageIndex = 2
      Images = cxButtonImageList
      Spacing = 10
      Version = '1.0.0.1'
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAcceptClick
    end
    object btnCancel: TAeroButton
      AlignWithMargins = True
      Left = 679
      Top = 0
      Width = 100
      Height = 35
      ImageIndex = 1
      Images = cxButtonImageList
      Spacing = 10
      Version = '1.0.0.1'
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object btnHoleshot: TAeroButton
      AlignWithMargins = True
      Left = 526
      Top = 0
      Width = 147
      Height = 35
      ImageIndex = 4
      Images = cxButtonImageList
      Spacing = 10
      Version = '1.0.0.1'
      Anchors = [akTop, akRight]
      Caption = 'Holeshot'
      TabOrder = 2
      OnClick = btnHoleshotClick
    end
  end
  object QInsertGrillaTTCategoria: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'INSERT INTO grilla_de_partida_categorias(categoria_oid, evento_o' +
        'id, hora_de_largada, segundos_entre_pilotos) '
      
        'select DISTINCT cat.oid, ipe.evento_oid, STR_TO_DATE('#39'12:00 PM'#39',' +
        ' '#39'%h:%i %p'#39'), 10'
      'from inscripcion_piloto_evento ipe'
      '     join piloto p on ipe.piloto_oid = p.oid'
      '     join categorias cat on '
      '     case ipe.tipo_categoria_oid'
      '          when 1 then p.categoria_oid'
      '          when 2 then p.categoria_cuatriciclos_oid'
      '          when 3 then p.categoria_motocross_oid'
      '          when 4 then p.categoria_externa_oid'
      '     end = cat.oid     '
      'where ipe.evento_oid = :evento_oid'
      '      and cat.oid not in (select gpc.categoria_oid '
      '                         from grilla_de_partida_categorias gpc '
      '                         where gpc.evento_oid = ipe.evento_oid)'
      'order by cat.oid       ')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 152
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object SelectPilotosEvento: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select p.oid piloto_oid, p.nombre, p.apellido,'
      
        '       sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_c' +
        'ategoria_oid, ipe.evento_oid, p.oid) categoria_oid,'
      
        '       sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tip' +
        'o_categoria_oid, ipe.evento_oid, p.oid) categoria,'
      
        '       sel_total_puntos_by_event_oid_and_pilot_oid(ipe.evento_oi' +
        'd, ipe.piloto_oid, e.campeonato_oid, ipe.tipo_categoria_oid, sel' +
        '_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_o' +
        'id, ipe.evento_oid, p.oid)) total,'
      
        '       sel_puntos_by_event_oid_and_pilot_oid(select_evento_previ' +
        'o_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_catego' +
        'ria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, ipe.evento_oid, p.oid)) puntos_ant,'
      
        '       sel_puesto_by_event_oid_and_pilot_oid(select_evento_previ' +
        'o_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_catego' +
        'ria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, ipe.evento_oid, p.oid)) pos_ant'
      'from inscripcion_piloto_evento ipe'
      '     join piloto p on ipe.piloto_oid = p.oid'
      '     join evento e on e.oid = ipe.evento_oid'
      'where ipe.evento_oid = :evento_oid'
      'and p.oid not in (select gp.piloto_oid '
      
        '                           from grilla_de_partida_categorias gpc' +
        ' '
      
        '                           join grilla_de_partida gp on gpc.oid ' +
        '= gp.grilla_de_partida_categoria_oid'
      '                           where gpc.evento_oid = :evento_oid'
      
        '                                 and gp.categoria_oid = sel_cate' +
        'goria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, i' +
        'pe.evento_oid, p.oid))'
      'order by categoria, '
      'ipe.es_dia_inscripcion desc, '
      'total desc,'
      'puntos_ant desc,  '
      'pos_ant, '
      'CASE WHEN e.nro_fecha = 1 THEN p.ranking IS NULL ELSE 0 END, '
      'CASE WHEN e.nro_fecha = 1 THEN p.ranking = 0 ELSE 0 END,'
      'CASE WHEN e.nro_fecha = 1 THEN p.ranking ELSE 0 END,'
      'ipe.oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 32
    Top = 488
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object InsertPilotosEvento: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'INSERT INTO grilla_de_partida'
      
        '    (piloto_oid, categoria_oid, grilla_de_partida_categoria_oid,' +
        ' estado_piloto_partida, orden)'
      'VALUES'
      
        '    (:piloto_oid, :categoria_oid, :grilla_de_partida_categoria_o' +
        'id, 1, :orden)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'orden'
        ParamType = ptInput
      end>
    Left = 264
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'orden'
        ParamType = ptInput
      end>
  end
  object SelectTTCategoria: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select oid '
      'from grilla_de_partida_categorias gpc '
      'where gpc.categoria_oid = :categoria_oid'
      '      and gpc.evento_oid =:evento_oid ')
    Params = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 360
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object QueryCategorias: TZQuery
    Connection = ConnectionModule.ZConnection
    SortedFields = 'orden_de_largada, orden_de_largada_posicion'
    SQL.Strings = (
      
        'select gpc.oid, gpc.tipo_de_largada_oid, gpc.orden_de_largada, g' +
        'pc.categoria_oid, gpc.hora_de_largada, segundos_entre_pilotos, c' +
        'ant_piloto_por_largada,'
      '  orden_de_largada_posicion, cant_posiciones_muertas'
      'from grilla_de_partida_categorias gpc'
      'where gpc.evento_oid = :evento_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    IndexFieldNames = 'orden_de_largada Asc, orden_de_largada_posicion Asc'
    Left = 40
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object DSCategorias: TDataSource
    DataSet = QueryCategorias
    Left = 40
    Top = 104
  end
  object QueryPilotos: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select gp.oid, sel_nro_moto_by_categoria(gp.categoria_oid, gp.pi' +
        'loto_oid) as nro_moto, '
      
        'gp.piloto_oid, gp.categoria_oid, grilla_de_partida_categoria_oid' +
        ','
      
        'gp.estado_piloto_partida, gp.estado_piloto_partida, gp.descripci' +
        'on_cambio_estado, gp.orden'
      'from grilla_de_partida gp')
    Params = <>
    MasterFields = 'oid'
    MasterSource = DSCategorias
    LinkedFields = 'grilla_de_partida_categoria_oid'
    Left = 120
    Top = 312
  end
  object DSPilotos: TDataSource
    DataSet = QueryPilotos
    Left = 120
    Top = 256
  end
  object TipoDeLargada: TZTable
    Connection = ConnectionModule.ZConnection
    TableName = 'tipo_de_largada'
    Left = 32
    Top = 256
  end
  object DSTipoDeLargada: TDataSource
    DataSet = TipoDeLargada
    Left = 32
    Top = 312
  end
  object Categoria: TZTable
    Connection = ConnectionModule.ZConnection
    TableName = 'categorias'
    Left = 216
    Top = 256
  end
  object DSCategoria: TDataSource
    DataSet = Categoria
    Left = 216
    Top = 312
  end
  object cxButtonImageList: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 22151911
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000050101
          0122060606460D0D0D5F0E0E0E600707074B0101012800000008000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000011191919766B696BCCB0A9
          B0F2CAC0CAFFC7BEC6FFC1B8C0FFBAB0B9FF9F979EF5656365D41E1E1E840000
          001A000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000909094E7E7C7ED6E9E0E9FFC9D2C9FF88B1
          88FF57A359FF42A748FF42A94BFF51A35BFF76A67DFFA2B0A4FFB8AFB6FF7B78
          7BE60E0E0E610000000100000000000000000000000000000000000000000000
          000000000000000000001C1C1C7AE9E5E9FFE3E4E3FF529A4DFF14A00FFF0EB0
          0FFF12BA19FF10BF1DFF19C42BFF1DC734FF1CC436FF21BC3CFF44A154FFA5AB
          A6FFB8B1B7FF2828289800000006000000000000000000000000000000000000
          0000000000001D1D1D77EDE9EDFFBACBB8FF208B14FF0BA601FF19B014FF17B2
          19FF1AB922FF78D07FFF55CD65FF20C33AFF2AC747FF2BCB4CFF24CE46FF22AF
          3DFF82A287FFC0B8BFFF25252590000000000000000000000000000000000000
          000006060642E0DCE0FCBDC8BAFF108602FF119F01FF19A50EFF0FA90BFF2BB8
          2DFF9FCFA2FFEAD8E8FF61CE70FF15C132FF29C74AFF30CA55FF2FCA54FF2ACF
          4BFF1BBA36FF809F85FFB7AFB6FF0D0E0D620000000000000000000000000000
          000D7A797ACBDEDDDEFF29821AFF129400FF169903FF0E9F02FF54BB4FFFC5D5
          C5FFD9D1D9FFD3CED2FF9AD2A2FF65CE77FF3CCC5AFF26C94DFF2FCA54FF2CC8
          4CFF26CD42FF1DB131FF9CAA9DFF7E7B7DE60101012100000000000000001313
          1361F3EDF4FF6B9762FF0E8900FF179000FF1D9909FF90CA8BFFE4E0E5FFDCD8
          DCFFD4D4D4FFD0D0D0FFD5CED4FFDBD1D9FFCBD6CDFF72D487FF25C847FF28C7
          47FF27C740FF1ACC30FF47A451FFC0B6BFFF1B1C1B7D00000000000000016766
          67BAE0DEE0FF2F851AFF188A00FF178C00FF289913FFBFD9BDFFEFE6F0FFDEDD
          DEFFD9D9D9FFD6D6D6FFD5D2D5FFCFCECFFFD0CDD0FFDDD3DBFF85D393FF1EC4
          39FF24C43AFF20C733FF18B125FFA1AAA1FF5B595BC60000000700000015B1AF
          B2E4AEB9ACFF1C7E03FF1B8600FF1C8A00FF168C00FF199709FF8AC783FFECE7
          ECFFE5E0E5FFDBDBDBFFCEDACFFFDAD7DAFFD5D1D4FFCECDCEFFD8D2D7FF53CB
          63FF1AC02CFF1FC22EFF10C11CFF6BA16EFF9E969EF60101012B04040430CFCD
          D0F9A9B6A5FF3E9324FF167F00FF1D8600FF1C8900FF188F01FF119501FF53B5
          4BFFCFDFCEFFF6E8F6FF66C86AFF4DC154FFCDD9CEFFD6D3D6FFD7CFD6FFA9D2
          ACFF1ABE27FF1CBE26FF12C219FF44A247FFB8AEB7FF0909095208080842D6D4
          D7FFAEBCA9FF8DBE7BFF378E1DFF167F00FF138100FF118600FF118D00FF0E94
          00FF2CA824FFBCDBBAFF63C364FF05A90AFF70C874FFE3DBE3FFD6D4D6FFCFD6
          CFFF30C036FF16BA1CFF12BF14FF35A535FFBFB6BFFF0F0F0F6408080841D3D2
          D4FFB2BDAEFF9FC68FFF8EBD7EFF4D9A35FFA7CE9DFFBBDAB3FFBDDBB7FF46A7
          39FF109401FF1DA114FF26A920FF16A713FF4BBB4BFFE4E0E4FFDBDADBFFD9DA
          D9FF3CBF3DFF11B412FF0EBA0DFF35A333FFC5BCC5FF0F0F0F630303032DC5C4
          C5F8B7BCB5FFA7C998FF9AC28AFF97C287FFEEF5ECFFFFFFFFFFFFFFFFFF8BC4
          81FF088800FF1A980AFF1B9D0FFF0B9D02FF65C061FFEDE6EEFFE1DFE1FFD8DE
          D8FF2CB627FF11B00CFF10B508FF4C9F47FFC6BDC7FF0808084E00000013A4A4
          A4E0BFBFBFFFAFCAA3FFA3C693FF97C086FFD4E6CEFFFFFFFFFFFFFFFFFFF5F9
          F5FF5BAB4AFF0F8A00FF0E9000FF44AD37FFD9E6D8FFECE9ECFFEDE7EDFFBADA
          B8FF22AF18FF2DB421FF1DAF0EFF82AB7EFFAEA7AFF201010126000000005E5E
          5EB2D4D3D5FFBECCB7FFADCC9EFFA2C693FFB0CFA4FFFDFEFDFFFFFFFFFFFFFF
          FFFFF9FBF8FFC4E0BEFFBBDDB5FFF2F5F1FFF8F5F9FFF1F1F1FFF6F2F7FF7DC8
          73FF3DB22DFF3BB72AFF2EA021FFCACEC9FF616061BF00000004000000001010
          1055DAD9DAFFB9BBB8FFC2D9B6FFACCB9EFFA2C693FFCFE2C7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFCFBFCFFFFFDFFFFB8DDB1FF4CB2
          3BFF4DB53DFF3BB52AFF6EA866FFF0E8F1FF1919197300000000000000000000
          0008696969BDCBCACCFFBFC6BCFFBCD6B0FFAECCA1FFA5C896FFC7DEBEFFF7FA
          F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F9F5FFB3D9AAFF65B855FF5DB6
          4CFF55BA44FF489D3BFFD6DAD5FF898889DB0000001800000000000000000000
          000004040433C5C5C5F6BEBDBFFFC7D1C3FFBFD8B3FFB0CDA2FFA5C897FFA9CC
          9BFFC1DBB8FFD5E7CFFFD4E7CEFFB8D9AFFF8CC47DFF6FB75DFF6FB95EFF67BC
          56FF55A547FFBBC6BAFFE0DDE0FF090909510000000000000000000000000000
          00000000000016161663D1D1D1FDC0BEC0FFC0C6BDFFC7DCBCFFB5D2A8FFAACB
          9CFFA0C691FF98C389FF91C081FF88BE78FF85BE75FF81C070FF77BD66FF6FA4
          64FFC2CAC0FFF0EDF1FF2020207C000000000000000000000000000000000000
          0000000000000000000015151561CBCACBFACDCCCDFFBABBB9FFC5D0C0FFBDD4
          B2FFB3D1A6FFACD09EFFA4CC95FF9AC78CFF91C183FF8CB881FF99AF93FFE2E0
          E2FFE3E0E3FF2020207E00000000000000000000000000000000000000000000
          000000000000000000000000000006060639686868BFD8D7D8FFD2D1D3FFC5C6
          C5FFB8BCB6FFBAC2B6FFB7C1B3FFB0BAACFFC0C6BFFFDFDEDFFFE9E6EAFF8080
          80D2090909490000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000711111159606060B6A7A6
          A7E4C6C5C7F9D2D1D3FFD5D3D6FFD0CED1FBB1B1B1E86C6C6CC0161616670000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000040000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000112347
          22A6111E11790000000700000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000010001112A6228BF4AE2
          48FF44D042FF1627168700000009000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000010001132C6629C24EDF53FF44E8
          9BFF4BE584FF46D23FFF192E18900000000C0000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000001010118306C2DC44BDF53FF39E491FF7CF3
          C5FF7EF0C3FF48E281FF47D644FF1C381B9B0000001100000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000001010118336E2FC649DF53FF28DF86FF42EAA3FF88F3
          C6FFBCF9E0FF81EEBFFF47DF80FF48D845FF21421FA600000014000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001010219356929C743D146FF20D979FF09DD79FF38E493FF62EA
          AAFF81EEBBFF93F1C6FF57E6A2FF44D979FF4BCA3DFF23461DB0000001170000
          0001000000000000000000000000000000000000000000000000000000000000
          00000201021C396724CE3FC13AFF1CD56FFF07D56AFF0AD56BFF16D773FF36DD
          86FF4DE193FF54E297FF4FE296FF24D97AFF39D16DFF4EBB34FF2A4E1CBE0100
          011D000000010000000000000000000000000000000000000000000000000202
          021C3C6220D13AB22EFF19D064FF0BCF5EFF0BCE5CFF0BCE5CFF0CCE5EFF18D1
          65FF25D46FFF26D36EFF19D166FF0CCF5EFF04CC58FF33CB62FF4DAC2AFF2C4E
          17C50101022200000001000000000000000000000000000000000000000B3959
          20C935A927FF16CA58FF0DC851FF1CCA5AFF37D16DFF50D67FFF61DA8DFF67DF
          91FF6BE194FF78E09DFF71DE97FF69DC92FF4AD67DFF1ECC5DFF2AC353FF47A2
          24FF315319CD0202022A00000001000000000000000000000000010101143C97
          36F613C144FF20C450FF4ACF70FF66D685FF70D98DFF78DB94FF74E191FF429D
          58E83C8C4EDC7FE399FF95E4ACFF99E4ADFFA2E6B4FFA0E6B4FF74DB93FF3FC0
          58FF429B1FFF36591BD703030331000000010000000000000000000000042952
          31A337C752FF68D47DFF6FD483FF70D484FF7AD88DFF72DB85FF408A4ADE0404
          032B010101153A7841CD89E197FFA4E5B2FFA3E4AFFFAAE5B5FFB8EAC1FFAAE6
          B6FF4BB955FF3D921AFF395B1CDD040404380000000100000000000000000000
          0000253B268C5BC561FF78D482FF81D68AFF70D277FF366836C60202021C0000
          0000000000000101010F335E33BA8FDC92FFB5E8BBFFB2E5B7FFB8E7BCFFC2EB
          C7FFBFE9C4FF56B555FF378914FF3D601CE60707064500000003000000000000
          0000000000001C281A7562BC5DFF6ECA69FF2C4E2AB10100010D000000000000
          00000000000000000000000000072D4D29AD93D68EFFC5EDC5FFC1E8C1FFC7EA
          C6FFD1EED1FFD2EFD2FF60B258FF32800EFF3F601EED0303032F000000000000
          00000000000000000000141C135F21321E8A0000000400000000000000000000
          000000000000000000000000000000000001253D219A93CE8AFFD4F0D0FFD1EC
          CDFFD5EDD2FFDFF2DCFFE2F4E0FF70B565FF3F8621FF08090749000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001E2E1B8691C785FFE2F5
          DCFFDFF0D9FFE3F2DEFFF6FDF3FFCEECC8FF33612BD201010119000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001622147591C5
          84FFEEF9E8FFF9FEF5FFBDE1B5FF2D4C28B80100011100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001118
          0F6091C286FEA6D29CFF1D2F1992000000030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000C110A5110190E6700000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
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
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000080C0B
          0B433533308944433DA036332F9322201C7D100F0D5D04040430000000120000
          00130000000F0000000500000001000000000000000000000000000000000000
          000000000000000000000000000000000000000000000506051335332F90B7B0
          A1F8D7CFBDFFD7CFBDFFC5BFADFF9D927EFF766249FF5E5344DE1B1A19760000
          0128000000240000001E000000120000000A0000000300000000000000000000
          000000000000000000000000000000000000030303055C5B5696C5BBA9FFEBE1
          D2FFF8F2E9FFFCF6EFFFF7F0E3FFD8D4C7FF9A8F7DFF6E583EFF7D7160F72221
          1F7E0000001D000000210000001F000000190000000F00000000000000000000
          00000000000000000000000000000000000049494762BBB3A8F9E0D6D1FFF4ED
          E2FFFAF1DFFFF7EEDDFFFFFAF0FFFBF5F2FFD9D4CCFF887A66FF6D5C45FF7A77
          6CE50C0C0C450000000200000011000000110000000D00000000000000000000
          00000000000000000000000000001515151D85827EBFC7BEC0FFEBE1DCFFF5E8
          CEFFF7EACBFFEFDFC0FFFDEFD2FFFCF5E9FFF5EFE9FFBCB6A5FF6C5B46FF8B86
          77FF3F403E960202020900000000000000020000000100000000000000000000
          0000000000000000000000000000393A394FB2ADA6F9BEB7C7FFF1E8D5FFF3E7
          CAFFFAEFD8FFFFF3DAFFF8EBCFFFEFE1C6FFFBF5ECFFDBD7D5FF897C67FF7A70
          5EFF7E817BD72324232F00000000000000000000000000000000000000000000
          0000000000000D0E0E130F1010165E5E5C84B1ABBCFFB3ACCBFFD1CBD1FFE7DC
          C5FFF2E7CFFFECE1CBFFEEE1CBFFF2E6CBFFFDF4E3FFE7E3E6FFA4998AFF6D60
          4DFF95968EFE3D3E3D5B00000000000000000000000000000000000000000000
          000000000000313232473E403F5A747573B9A6A0BAFFCFC6D0FFC1BAC2FFBCB5
          C4FFEFE7D8FFF9F3DFFFFFFDE7FFFAF1DAFFEADECAFFEDE8EBFFB8AFA8FF6658
          43FF6D6A61FF494B497800000000000000000000000000000000000000000000
          0000000000004A4C496F5B5E598A7A7C80D59994C9FFE6E2E9FFFBF9E2FFE1DD
          E8FFC4C1C7FFA09D92FFBDB9ACFFDFD8C7FFEAE0CDFFE3DDD3FFC4BCB4FF6151
          3FFF463E32FF4748478302020203000000000000000000000000000000000000
          000000000000474A476C585C57877D7E82D4948FB2FFC9C7C9FFF3EFDDFFFFFF
          FEFF999894FF6D6861FF9B978FFFA7A49AFFCFC7BAFFE7E1EDFFC4BDC2FF6658
          43FF474035FF4647468302020203000000000000000000000000000000000000
          0000000000002F3131483B3E3D5B6E716FB8918EA6FFC0BDC8FFF0EBDFFFFFFF
          F7FF7F7C76FFB2AA9FFFF2EDE3FFEDEAE0FFDAD4C8FFD8D4DFFFCAC5C4FF726A
          58FF64665EFF4446447600000000000000000000000000000000000000000000
          0000000000000D0D0D140F100F17525553828D8CC0FFBDBBE4FFF9F8F0FFEFED
          E7FF7F7B77FFC3BDB3FFECE8DDFFF9F6E9FFE1DEDDFFCAC7ECFFC8C3BEFF7F7D
          6FFF838B87FD3437365A00000000000000000000000000000000000000000000
          00000000000000000000000000003234324AA0A2B6F59F9EE1FFBCBAC3FFD7D5
          CAFF898683FFC7C4BBFFE5E1D9FFDCD8CDFFB7B4BAFFC5C0C9FFCAC7BEFF9198
          91FF818B89D4191B1A2B00000000000000000000000000000000000000000000
          00000000000000000000000000001212111B8E9194BD9D9CCBFF9898BBFFE5E4
          E7FF989691FFBBB8AEFFEFEEE6FFCFCEE1FF9B97D4FFDBD7D5FFC7CBC1FFAEBD
          BCFF5F6665940505050800000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C3F3D5CCAC9BEF5A2A0EDFF9899
          C7FF7E7E84FFA5A5B7FFAEAFCAFF8380C4FFB2ACBFFFF0F1E7FFCBD3CFFFA1AE
          ACDD1F2222350000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000202020365676590D7D3DDFFB4B2
          CDFF807E9DFF7574B9FF7976A7FFADA4AEFFFBF8F3FFF0F4EFFFC1C9C5F13B40
          3F61000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000A0B0B1263665F8FBFBC
          B5EBCAC3C6FFBFB7BDFFCFC7C5FEEDEBE0F8D9DDDCF29FA5A2CC393C3C5C0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000030303052A2C
          2C454C4F4C72B5B4AEDAC2C2BDF7595E5E87393C3B4F15161623000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000017191A308D8D8CDE817C78FC373937810000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000202
          020442474790BDBCB9FB999695FF696A68E01517163200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001112
          12234247458C474C4C78474B4C7F464A4A8B3235336F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001011
          111F4649488F0B0D0D1B03030306373C3B6E3539387000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00004144427F3E413F852B2D2B545D6363A81214142800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000080A0A144B504E906B6F6DB2262A2A4C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object ZUpdatePilotoEstado: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'UPDATE'
      '  grilla_de_partida'
      'SET'
      '  estado_piloto_partida = :estado_piloto_partida,'
      '  descripcion_cambio_estado = :descripcion_cambio_estado'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'estado_piloto_partida'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descripcion_cambio_estado'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 456
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'estado_piloto_partida'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descripcion_cambio_estado'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZInsertLargadaJuntos: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'INSERT INTO toma_tiempos (piloto_oid, tiempo_pasada, is_deleted,' +
        ' nro_vuelta, evento_oid, categoria_oid)'
      
        'SELECT gp.piloto_oid, :tiempo_pasada, 0, 0, :evento_oid, gp.cate' +
        'goria_oid'
      'FROM grilla_de_partida gp'
      
        'WHERE gp.grilla_de_partida_categoria_oid = :grilla_de_partida_ca' +
        'tegoria_oid'
      '      AND gp.estado_piloto_partida = 1')
    Params = <
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end>
    Left = 224
    Top = 376
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end>
  end
  object ZInsertXPorTiempo: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'INSERT INTO toma_tiempos (piloto_oid, tiempo_pasada, is_deleted,' +
        ' nro_vuelta, evento_oid, categoria_oid)'
      
        'SELECT gp.piloto_oid, :tiempo_pasada, 0, 0, :evento_oid, gp.cate' +
        'goria_oid'
      'FROM grilla_de_partida gp'
      
        'WHERE gp.grilla_de_partida_categoria_oid = :grilla_de_partida_ca' +
        'tegoria_oid'
      '      AND gp.estado_piloto_partida = 1'
      'ORDER BY gp.categoria_oid, gp.orden'
      'LIMIT :skip_rows, :first_rows')
    Params = <
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skip_rows'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'first_rows'
        ParamType = ptInput
      end>
    Left = 224
    Top = 440
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skip_rows'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'first_rows'
        ParamType = ptInput
      end>
  end
  object SelectXPorTiempo: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'SELECT gp.piloto_oid, current_timestamp, 0, 0'
      'FROM grilla_de_partida gp'
      
        'WHERE gp.grilla_de_partida_categoria_oid = :grilla_de_partida_ca' +
        'tegoria_oid'
      '      AND gp.estado_piloto_partida = 1'
      'ORDER BY gp.categoria_oid, gp.orden'
      'LIMIT :skip_rows, :first_rows')
    Params = <
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skip_rows'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'first_rows'
        ParamType = ptInput
      end>
    Left = 352
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skip_rows'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'first_rows'
        ParamType = ptInput
      end>
  end
  object ZDeleteTomaTiempoXEvento: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  toma_tiempos'
      'WHERE'
      '  evento_oid= :evento_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 352
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object DeleteGrillaTTPilotos: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'delete from grilla_de_partida'
      'where grilla_de_partida_categoria_oid in '
      
        '      (select oid from grilla_de_partida_categorias where evento' +
        '_oid = :evento_oid)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
    Left = 712
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
  end
  object ZFilterPiloto: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select p.oid, CONCAT(p.apellido, '#39', '#39' , p.nombre) as nombre'
      'from piloto p'
      'order by p.apellido, p.nombre')
    Params = <>
    Left = 584
    Top = 272
  end
  object DSFilterPiloto: TDataSource
    DataSet = ZFilterPiloto
    Left = 584
    Top = 320
  end
  object GrillaPartidaEstado: TZTable
    Connection = ConnectionModule.ZConnection
    TableName = 'grilla_partida_estado'
    Left = 120
    Top = 368
  end
  object DSGrillaPartidaEstado: TDataSource
    DataSet = GrillaPartidaEstado
    Left = 120
    Top = 424
  end
  object ZGetNroOrden: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select max(gp.orden)  max_orden'
      'from grilla_de_partida gp'
      
        'join grilla_de_partida_categorias gpc on gp.grilla_de_partida_ca' +
        'tegoria_oid = gpc.oid'
      'where gp.categoria_oid = :categoria_oid'
      'and gpc.evento_oid = :evento_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 592
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object QueryPilotosExport: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select gp.oid, sel_nro_moto_by_categoria(gp.categoria_oid, gp.pi' +
        'loto_oid) as nro_moto, '
      
        'gp.piloto_oid, gp.categoria_oid, grilla_de_partida_categoria_oid' +
        ','
      
        'gp.estado_piloto_partida, gp.estado_piloto_partida, gp.descripci' +
        'on_cambio_estado, gp.orden'
      'from grilla_de_partida gp')
    Params = <>
    MasterFields = 'oid'
    MasterSource = DSCategorias
    LinkedFields = 'grilla_de_partida_categoria_oid'
    Left = 752
    Top = 280
  end
  object ROQGetGrillaPartida: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select p.telefono as Telefono, gpc.orden_de_largada as '#39'Nro. Lar' +
        'gada'#39', gp.orden Partida, p.ranking as '#39'Ranking'#39', c.nombre as Cat' +
        'egoria, '
      
        '       sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, ipe.evento_oid, ipe.piloto_oid) as '#39'Nro. Moto'#39', '
      
        '       CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words' +
        '(CONCAT(p.apellido, '#39', '#39' , p.nombre)), IFNULL(UC_Words(CONCAT('#39' ' +
        '/ '#39', n.apellido, '#39', '#39' , n.nombre)), '#39#39')) '
      
        '            ELSE UC_Words(CONCAT(p.apellido, '#39', '#39' , p.nombre)) E' +
        'ND as Piloto,'
      '       mm.nombre as Modelo, ipe.oid as '#39'Orden de Inscripcion'#39','
      
        '       sel_total_puntos_by_event_oid_and_pilot_oid(ipe.evento_oi' +
        'd, ipe.piloto_oid, e.campeonato_oid, ipe.tipo_categoria_oid, sel' +
        '_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_o' +
        'id, ipe.evento_oid, p.oid)) Puntos,'
      
        '       sel_total_puesto_by_event_oid_and_pilot_oid(ipe.evento_oi' +
        'd, ipe.piloto_oid, e.campeonato_oid, c.nombre) Puesto,'
      
        '       LEFT(TIME_FORMAT(CAST(tt.tiempo_pasada AS TIME), '#39'%H:%i:%' +
        's'#39'), 6) as tiempo_pasada,'
      '       tt.tiempo_pasada '#39'Tiempo Inicial'#39
      'from grilla_de_partida_categorias gpc'
      
        '     inner join grilla_de_partida gp on gp.grilla_de_partida_cat' +
        'egoria_oid = gpc.oid'
      '     inner join categorias c on gp.categoria_oid = c.oid'
      
        '     inner join inscripcion_piloto_evento ipe on (ipe.evento_oid' +
        ' = gpc.evento_oid and ipe.piloto_oid = gp.piloto_oid and ipe.tip' +
        'o_categoria_oid = c.tipo_categoria_oid)'
      '     inner join piloto p on gp.piloto_oid = p.oid'
      '     inner join modelo_moto mm on p.modelo_moto_oid = mm.oid'
      '     inner join evento e on ipe.evento_oid = e.oid '
      
        '     left join toma_tiempos tt on (tt.evento_oid = ipe.evento_oi' +
        'd  and p.oid = tt.piloto_oid and tt.nro_vuelta = 0 and tt.catego' +
        'ria_oid = c.oid)'
      '    left join navegante n on n.piloto_oid = p.oid'
      'where gp.estado_piloto_partida = 1'
      '      and gpc.evento_oid = :evento_oid'
      
        'order by gpc.orden_de_largada, gpc.orden_de_largada_posicion, gp' +
        '.orden, c.nombre, gp.orden   ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
    Left = 472
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
  end
  object ZCountLargadaJuntos: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'SELECT count(gp.oid) as cuenta'
      'FROM grilla_de_partida gp'
      
        'WHERE gp.grilla_de_partida_categoria_oid = :grilla_de_partida_ca' +
        'tegoria_oid'
      '      AND gp.estado_piloto_partida = 1')
    Params = <
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end>
    Left = 328
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'grilla_de_partida_categoria_oid'
        ParamType = ptInput
      end>
  end
  object scExcelExport: TscExcelExport
    DataPipe = dpDataSet
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontHeader.Charset = DEFAULT_CHARSET
    FontHeader.Color = clWindowText
    FontHeader.Height = 1
    FontHeader.Name = 'Tahoma'
    FontHeader.Orientation = 0
    FontHeader.Style = []
    FontHeader.Alignment = haGeneral
    FontHeader.WrapText = False
    BorderHeader.BackAlternateColor = clBlack
    MergeHeaderCells = True
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = 1
    FontTitles.Name = 'Tahoma'
    FontTitles.Orientation = 0
    FontTitles.Style = []
    FontTitles.Alignment = haGeneral
    FontTitles.WrapText = False
    BorderTitles.BackAlternateColor = clBlack
    AutoFilter = False
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = 1
    FontData.Name = 'Tahoma'
    FontData.Orientation = 0
    FontData.Style = []
    FontData.Alignment = haGeneral
    FontData.WrapText = False
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = 1
    FontSummary.Name = 'Tahoma'
    FontSummary.Orientation = 0
    FontSummary.Style = []
    FontSummary.Alignment = haGeneral
    FontSummary.WrapText = False
    BorderSummary.BackAlternateColor = clBlack
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    FontFooter.Charset = DEFAULT_CHARSET
    FontFooter.Color = clWindowText
    FontFooter.Height = 1
    FontFooter.Name = 'Tahoma'
    FontFooter.Orientation = 0
    FontFooter.Style = []
    FontFooter.Alignment = haGeneral
    FontFooter.WrapText = False
    BorderFooter.BackAlternateColor = clBlack
    MergeFooterCells = True
    FontGroup.Charset = DEFAULT_CHARSET
    FontGroup.Color = clWindowText
    FontGroup.Height = 1
    FontGroup.Name = 'Tahoma'
    FontGroup.Orientation = 0
    FontGroup.Style = []
    FontGroup.Alignment = haGeneral
    FontGroup.WrapText = False
    BorderGroup.BackAlternateColor = clBlack
    GroupOptions.ClearContents = True
    GroupOptions.BorderRange = bsRow
    GroupOptions.IntervalFontSize = 2
    Left = 136
    Top = 136
  end
  object ROQControlDePaso: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select gpc.orden_de_largada as '#39'Nro. Largada'#39', gpc.orden_de_larg' +
        'ada_posicion '#39'Orden Largada'#39','
      'gp.orden Partida, c.nombre as Categoria, '
      
        '       sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, ipe.evento_oid, ipe.piloto_oid) as '#39'Nro. Moto'#39', '
      
        '       CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words' +
        '(CONCAT(p.apellido, '#39', '#39' , p.nombre)), IFNULL(UC_Words(CONCAT('#39' ' +
        '/ '#39', n.apellido, '#39', '#39' , n.nombre)), '#39#39')) '
      
        '            ELSE UC_Words(CONCAT(p.apellido, '#39', '#39' , p.nombre)) E' +
        'ND as Piloto, mm.nombre as Modelo, CONCAT("'#39'", p.tid) Tag,'
      '       ifnull(enc.nro_vueltas, 0) '#39'Cantidad de vueltas'#39','
      
        '       '#39' '#39' as '#39'1er Vuelta'#39', '#39' '#39' as '#39'2da Vuelta'#39', '#39' '#39' as '#39'3ra Vue' +
        'lta'#39', '#39' '#39' as '#39'4ta Vuelta'#39'      , '#39' '#39' as '#39'5ta Vuelta'#39','
      
        '       '#39' '#39' as '#39'6ta Vuelta'#39', '#39' '#39' as '#39'7ma Vuelta'#39', '#39' '#39' as '#39'8va Vue' +
        'lta'#39', '#39' '#39' as '#39'9na Vuelta'#39'      , '#39' '#39' as '#39'10ma Vuelta'#39'       '
      'from grilla_de_partida_categorias gpc'
      
        '     inner join grilla_de_partida gp on gp.grilla_de_partida_cat' +
        'egoria_oid = gpc.oid'
      '     inner join categorias c on gp.categoria_oid = c.oid'
      
        '     inner join inscripcion_piloto_evento ipe on (ipe.evento_oid' +
        ' = gpc.evento_oid and ipe.piloto_oid = gp.piloto_oid)'
      '     inner join piloto p on gp.piloto_oid = p.oid'
      '     inner join modelo_moto mm on p.modelo_moto_oid = mm.oid'
      '     inner join evento e on ipe.evento_oid = e.oid '
      
        '     left join toma_tiempos tt on (tt.evento_oid = ipe.evento_oi' +
        'd  and p.oid = tt.piloto_oid and tt.nro_vuelta = 0)'
      '     left join navegante n on n.piloto_oid = p.oid'
      
        '     left join evento_num_categoria enc on (enc.categoria_oid = ' +
        'c.oid and enc.evento_oid = e.oid)'
      'where gp.estado_piloto_partida = 1'
      '      and gpc.evento_oid = :evento_oid'
      
        'order by gpc.orden_de_largada, gpc.orden_de_largada_posicion, c.' +
        'nombre, gp.orden   ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
    Left = 472
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
  end
  object ROQControlParque: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select gpc.orden_de_largada as '#39'Nro. Largada'#39', gpc.orden_de_larg' +
        'ada_posicion '#39'Orden Largada'#39','
      'gp.orden Partida, c.nombre as Categoria, '
      
        '       sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, ipe.evento_oid, ipe.piloto_oid) as '#39'Nro. Moto'#39', '
      
        '       CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words' +
        '(CONCAT(p.apellido, '#39', '#39' , p.nombre)), IFNULL(UC_Words(CONCAT('#39' ' +
        '/ '#39', n.apellido, '#39', '#39' , n.nombre)), '#39#39')) '
      
        '            ELSE UC_Words(CONCAT(p.apellido, '#39', '#39' , p.nombre)) E' +
        'ND as Piloto, mm.nombre as Modelo, CONCAT("'#39'", p.tid) Tag,'
      
        '       '#39' '#39' as '#39'Ingreso'#39', '#39' '#39' as '#39'Pie'#39', '#39' '#39' as '#39'Largada'#39', '#39' '#39' as ' +
        #39'Otra'#39'       '
      'from grilla_de_partida_categorias gpc'
      
        '     inner join grilla_de_partida gp on gp.grilla_de_partida_cat' +
        'egoria_oid = gpc.oid'
      '     inner join categorias c on gp.categoria_oid = c.oid'
      
        '     inner join inscripcion_piloto_evento ipe on (ipe.evento_oid' +
        ' = gpc.evento_oid and ipe.piloto_oid = gp.piloto_oid)'
      '     inner join piloto p on gp.piloto_oid = p.oid'
      '     inner join modelo_moto mm on p.modelo_moto_oid = mm.oid'
      '     inner join evento e on ipe.evento_oid = e.oid '
      
        '     left join toma_tiempos tt on (tt.evento_oid = ipe.evento_oi' +
        'd  and p.oid = tt.piloto_oid and tt.nro_vuelta = 0)'
      '     left join navegante n on n.piloto_oid = p.oid'
      'where gp.estado_piloto_partida = 1'
      '      and gpc.evento_oid = :evento_oid'
      
        'order by gpc.orden_de_largada, gpc.orden_de_largada_posicion, c.' +
        'nombre, gp.orden   ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
    Left = 576
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
  end
  object SelectPilotosEventoNuevo: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select * from ('
      
        'SELECT * FROM (select p.oid piloto_oid, sel_categoria_oid_by_eve' +
        'nto_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, p' +
        '.oid) categoria_oid,'
      
        '       sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tip' +
        'o_categoria_oid, ipe.evento_oid, p.oid) categoria,'
      
        '       sel_puntos_by_event_oid_and_pilot_oid(select_evento_previ' +
        'o_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_catego' +
        'ria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, ipe.evento_oid, p.oid)) puntos,'
      
        '       CASE WHEN e.nro_fecha = 1 THEN sel_puesto_by_event_oid_an' +
        'd_pilot_oid(select_evento_previo_by_evento_oid(ipe.evento_oid), ' +
        'ipe.piloto_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_eve' +
        'nto_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, p' +
        '.oid)) '
      
        '            ELSE sel_puesto_by_event_oid_and_pilot_oid(select_ev' +
        'ento_previo_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.t' +
        'ipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categori' +
        'a(ipe.tipo_categoria_oid, ipe.evento_oid, p.oid))*-1 END puesto,'
      '            ipe.es_dia_inscripcion,'
      '            e.nro_fecha, p.ranking, ipe.oid'
      'from inscripcion_piloto_evento ipe'
      '     join piloto p on ipe.piloto_oid = p.oid'
      '     join evento e on e.oid = ipe.evento_oid'
      'where ipe.evento_oid = :evento_oid'
      'and p.oid not in (select gp.piloto_oid '
      
        '                           from grilla_de_partida_categorias gpc' +
        ' '
      
        '                           join grilla_de_partida gp on gpc.oid ' +
        '= gp.grilla_de_partida_categoria_oid'
      '                           where gpc.evento_oid = :evento_oid'
      
        '                                 and gp.categoria_oid = sel_cate' +
        'goria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, i' +
        'pe.evento_oid, p.oid))'
      
        '      AND sel_puesto_by_event_oid_and_pilot_oid(select_evento_pr' +
        'evio_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_cat' +
        'egoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.t' +
        'ipo_categoria_oid, ipe.evento_oid, p.oid)) <=10'
      ') AS t1'
      'UNION'
      
        'SELECT * FROM (select p.oid piloto_oid, sel_categoria_oid_by_eve' +
        'nto_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, p' +
        '.oid) categoria_oid,'
      
        '       sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tip' +
        'o_categoria_oid, ipe.evento_oid, p.oid) categoria,'
      
        '       sel_puntos_by_event_oid_and_pilot_oid(select_evento_previ' +
        'o_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_catego' +
        'ria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, ipe.evento_oid, p.oid)) puntos,'
      
        '       sel_puesto_by_event_oid_and_pilot_oid(select_evento_previ' +
        'o_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_catego' +
        'ria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, ipe.evento_oid, p.oid)) puesto,'
      '            ipe.es_dia_inscripcion,'
      '            e.nro_fecha, p.ranking, ipe.oid'
      'from inscripcion_piloto_evento ipe'
      '     join piloto p on ipe.piloto_oid = p.oid'
      '     join evento e on e.oid = ipe.evento_oid'
      'where ipe.evento_oid = :evento_oid'
      'and p.oid not in (select gp.piloto_oid '
      
        '                           from grilla_de_partida_categorias gpc' +
        ' '
      
        '                           join grilla_de_partida gp on gpc.oid ' +
        '= gp.grilla_de_partida_categoria_oid'
      '                           where gpc.evento_oid = :evento_oid'
      
        '                                 and gp.categoria_oid = sel_cate' +
        'goria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, i' +
        'pe.evento_oid, p.oid))'
      
        '      AND sel_puesto_by_event_oid_and_pilot_oid(select_evento_pr' +
        'evio_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_cat' +
        'egoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.t' +
        'ipo_categoria_oid, ipe.evento_oid, p.oid)) > 10'
      ') AS t2) t_general'
      'order by '
      'categoria,'
      'puesto, '
      'puntos desc,'
      'CASE WHEN nro_fecha = 1 THEN ranking IS NULL ELSE 0 END, '
      'CASE WHEN nro_fecha = 1 THEN ranking = 0 ELSE 0 END,'
      'CASE WHEN nro_fecha = 1 THEN ranking ELSE 0 END,'
      'oid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
  end
  object SelectPilotosEventoF10: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select p.oid piloto_oid, p.nombre, p.apellido,'
      
        '       sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_c' +
        'ategoria_oid, ipe.evento_oid, p.oid) categoria_oid,'
      
        '       sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tip' +
        'o_categoria_oid, ipe.evento_oid, p.oid) nom_cat, '
      
        '       sel_total_puesto_by_event_oid_and_pilot_oid(ipe.evento_oi' +
        'd, ipe.piloto_oid, e.campeonato_oid, '
      
        '                                                                ' +
        '   sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_ca' +
        'tegoria_oid, ipe.evento_oid, p.oid)) puesto_campeonato,'
      
        '       sel_total_puntos_by_event_oid_and_pilot_oid(ipe.evento_oi' +
        'd, ipe.piloto_oid, e.campeonato_oid, ipe.tipo_categoria_oid, sel' +
        '_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_o' +
        'id, ipe.evento_oid, p.oid)) total,'
      
        '       sel_puntos_by_event_oid_and_pilot_oid(select_evento_previ' +
        'o_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_catego' +
        'ria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, ipe.evento_oid, p.oid)) puntos_ant,'
      
        '       sel_puesto_by_event_oid_and_pilot_oid(select_evento_previ' +
        'o_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_catego' +
        'ria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, ipe.evento_oid, p.oid)) pos_ant,'
      
        '       ipe.es_dia_inscripcion                                   ' +
        '                                     '
      'from inscripcion_piloto_evento ipe'
      '     join piloto p on ipe.piloto_oid = p.oid'
      '     join evento e on e.oid = ipe.evento_oid'
      'where ipe.evento_oid = :evento_oid'
      'and p.oid not in (select gp.piloto_oid '
      
        '                           from grilla_de_partida_categorias gpc' +
        ' '
      
        '                           join grilla_de_partida gp on gpc.oid ' +
        '= gp.grilla_de_partida_categoria_oid'
      '                           where gpc.evento_oid = ipe.evento_oid'
      
        '                                 and gp.categoria_oid = sel_cate' +
        'goria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, i' +
        'pe.evento_oid, p.oid))'
      'order by categoria_oid, '
      '       ipe.es_dia_inscripcion desc, '
      '       CASE '
      '           WHEN puesto_campeonato = 1 THEN 10 '
      '           WHEN puesto_campeonato = 2 THEN 9'
      '           WHEN puesto_campeonato = 3 THEN 8'
      '           WHEN puesto_campeonato = 4 THEN 7           '
      '           WHEN puesto_campeonato = 5 THEN 6'
      '           WHEN puesto_campeonato = 6 THEN 5'
      '           WHEN puesto_campeonato = 7 THEN 4'
      '           WHEN puesto_campeonato = 8 THEN 3'
      '           WHEN puesto_campeonato = 9 THEN 2'
      
        '           WHEN puesto_campeonato = 10 THEN 1                   ' +
        '                                                                ' +
        '                                      '
      '      ELSE puesto_campeonato END,  '
      '      total desc,'
      '      puntos_ant desc,  '
      '      pos_ant,'
      '      ipe.es_dia_inscripcion')
    Params = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
  end
  object SelectPilotosEventoF5: TZQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select p.oid piloto_oid, p.nombre, p.apellido,'
      
        '       sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_c' +
        'ategoria_oid, ipe.evento_oid, p.oid) categoria_oid,'
      
        '       sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tip' +
        'o_categoria_oid, ipe.evento_oid, p.oid) nom_cat, '
      
        '       sel_total_puesto_by_event_oid_and_pilot_oid(ipe.evento_oi' +
        'd, ipe.piloto_oid, e.campeonato_oid, '
      
        '                                                                ' +
        '   sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_ca' +
        'tegoria_oid, ipe.evento_oid, p.oid)) puesto_campeonato,'
      
        '       sel_total_puntos_by_event_oid_and_pilot_oid(ipe.evento_oi' +
        'd, ipe.piloto_oid, e.campeonato_oid, ipe.tipo_categoria_oid, sel' +
        '_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_o' +
        'id, ipe.evento_oid, p.oid)) total,'
      
        '       sel_puntos_by_event_oid_and_pilot_oid(select_evento_previ' +
        'o_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_catego' +
        'ria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, ipe.evento_oid, p.oid)) puntos_ant,'
      
        '       sel_puesto_by_event_oid_and_pilot_oid(select_evento_previ' +
        'o_by_evento_oid(ipe.evento_oid), ipe.piloto_oid, ipe.tipo_catego' +
        'ria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo' +
        '_categoria_oid, ipe.evento_oid, p.oid)) pos_ant,'
      
        '       ipe.es_dia_inscripcion                                   ' +
        '                                     '
      'from inscripcion_piloto_evento ipe'
      '     join piloto p on ipe.piloto_oid = p.oid'
      '     join evento e on e.oid = ipe.evento_oid'
      'where ipe.evento_oid = :evento_oid'
      'and p.oid not in (select gp.piloto_oid '
      
        '                           from grilla_de_partida_categorias gpc' +
        ' '
      
        '                           join grilla_de_partida gp on gpc.oid ' +
        '= gp.grilla_de_partida_categoria_oid'
      '                           where gpc.evento_oid = ipe.evento_oid'
      
        '                                 and gp.categoria_oid = sel_cate' +
        'goria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, i' +
        'pe.evento_oid, p.oid))'
      'order by categoria_oid, '
      '       ipe.es_dia_inscripcion desc, '
      '       CASE '
      '           WHEN puesto_campeonato = 1 THEN 5'
      '           WHEN puesto_campeonato = 2 THEN 4'
      '           WHEN puesto_campeonato = 3 THEN 3'
      '           WHEN puesto_campeonato = 4 THEN 2           '
      
        '           WHEN puesto_campeonato = 5 THEN 1                    ' +
        '                                                                ' +
        '                              '
      '      ELSE puesto_campeonato END,  '
      '      total desc,'
      '      puntos_ant desc,  '
      '      pos_ant,'
      '      ipe.es_dia_inscripcion')
    Params = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end>
  end
end
