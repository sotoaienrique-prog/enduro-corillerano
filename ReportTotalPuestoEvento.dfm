object ReporteTotalPuestoEvento: TReporteTotalPuestoEvento
  Left = 0
  Top = 0
  Caption = 'ReporteTotalPuestoEvento'
  ClientHeight = 527
  ClientWidth = 1362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 0
    Top = 0
    Width = 1056
    Height = 816
    DataSet = ZSelectReporteEvento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    ReportTitle = 'Total de Puntos por Campeonato'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object bTitle: TQRBand
      Left = 38
      Top = 38
      Width = 980
      Height = 40
      AlignToBottom = False
      Color = clGray
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2592.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object lblTitle: TQRLabel
        Left = 0
        Top = 0
        Width = 374
        Height = 25
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          0.000000000000000000
          989.982638888889100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Clasificaci'#243'n General del Campeonato:'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
      object txtEvento: TQRDBText
        Left = 379
        Top = 0
        Width = 496
        Height = 25
        Size.Values = (
          66.145833333333340000
          1003.211805555556000000
          0.000000000000000000
          1311.892361111111000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clGray
        DataSet = ZEventos
        DataField = 'nombre_campeonato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 16
      end
    end
    object QRGroup: TQRGroup
      Left = 38
      Top = 78
      Width = 980
      Height = 59
      AlignToBottom = False
      BeforePrint = QRGroupBeforePrint
      Color = clGray
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        156.104166666666700000
        2592.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'ZSelectReporteEvento.nombre_categoria'
      Master = QuickReport
      ReprintOnNewPage = False
      object txtNombreCategoria: TQRDBText
        Left = 0
        Top = -1
        Width = 981
        Height = 38
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          100.541666666666700000
          0.000000000000000000
          -2.645833333333333000
          2595.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clYellow
        DataSet = ZSelectReporteEvento
        DataField = 'nombre_categoria'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object lblPuntosAcumulados: TQRLabel
        Left = 41
        Top = 40
        Width = 47
        Height = 18
        Size.Values = (
          47.625000000000000000
          108.479166666666700000
          105.833333333333300000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Puntos'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object lblPosicion: TQRLabel
        Left = 1
        Top = 40
        Width = 42
        Height = 18
        Size.Values = (
          47.625000000000000000
          2.645833333333333000
          105.833333333333300000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Posici'#243'n'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object lblNroMoto: TQRLabel
        Left = 87
        Top = 40
        Width = 50
        Height = 18
        Size.Values = (
          47.625000000000000000
          230.187500000000000000
          105.833333333333300000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Nro. Moto'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object lblPiloto: TQRLabel
        Left = 142
        Top = 40
        Width = 112
        Height = 18
        Size.Values = (
          47.625000000000000000
          375.708333333333400000
          105.833333333333300000
          296.333333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Piloto'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object lblModeloMoto: TQRLabel
        Left = 260
        Top = 40
        Width = 87
        Height = 15
        Size.Values = (
          39.687500000000000000
          687.916666666666800000
          105.833333333333300000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Modelo Moto'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object lblLocalidad: TQRLabel
        Left = 345
        Top = 40
        Width = 88
        Height = 18
        Size.Values = (
          47.625000000000000000
          912.812500000000100000
          105.833333333333300000
          232.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Localidad'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand: TQRBand
      Left = 38
      Top = 137
      Width = 980
      Height = 27
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRBandBeforePrint
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        71.437500000000000000
        2592.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object lblPosValue: TQRLabel
        Left = 0
        Top = 4
        Width = 41
        Height = 17
        Size.Values = (
          45.357142857142850000
          0.000000000000000000
          11.339285714285710000
          107.723214285714300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Caption = 'lblPosValue'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object txtPuntosAcumulados: TQRDBText
        Left = 41
        Top = 4
        Width = 47
        Height = 18
        Size.Values = (
          46.302083333333340000
          108.038194444444400000
          11.024305555555560000
          123.472222222222200000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'puntos_acumulados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object txtNroMoto: TQRDBText
        Left = 87
        Top = 4
        Width = 50
        Height = 18
        Size.Values = (
          47.625000000000000000
          230.187500000000000000
          10.583333333333330000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'nro_moto'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object txtPiloto: TQRDBText
        Left = 143
        Top = 4
        Width = 111
        Height = 18
        Size.Values = (
          47.625000000000000000
          378.354166666666700000
          10.583333333333330000
          293.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'nombre_apellido'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object txtModeloMoto: TQRDBText
        Left = 260
        Top = 4
        Width = 87
        Height = 18
        Size.Values = (
          47.625000000000000000
          687.916666666666800000
          10.583333333333330000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'nombre_moto'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object txtLocalidad: TQRDBText
        Left = 346
        Top = 4
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          915.458333333333200000
          10.583333333333330000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'localidad'
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object shape: TQRShape
        Left = 421
        Top = -1
        Width = 2
        Height = 50
        Size.Values = (
          132.291666666666700000
          1113.895833333333000000
          -2.645833333333333000
          5.291666666666667000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
  end
  object ZSelectReporteEvento: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        '  select distinct sel_nro_moto_by_evento_and_tipo_categoria(ipe.' +
        'tipo_categoria_oid, eve.oid, p.oid) as nro_moto, '
      
        '    CONCAT(p.apellido, '#39', '#39' , p.nombre) as nombre_apellido,  l.l' +
        'ocalidad, mm.nombre as nombre_moto, '
      
        '    sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_c' +
        'ategoria_oid, eve.oid, p.oid) as nombre_categoria,'
      
        '    sel_puntos_by_event_oid_and_pilot_oid(:evento_oid, p.oid) as' +
        ' punto_fecha,'
      
        '    case when sel_puesto_by_event_oid_and_pilot_oid(select_event' +
        'o_previo_by_evento_oid(:evento_oid), p.oid) = 0 then '#39#39' '
      
        '    else sel_puesto_by_event_oid_and_pilot_oid(select_evento_pre' +
        'vio_by_evento_oid(:evento_oid), p.oid) end as puesto_evento_ante' +
        'rior,'
      
        '    sel_puesto_by_event_oid_and_pilot_oid(:evento_oid, p.oid) as' +
        ' puesto_fecha, '
      
        '    sel_total_puntos_by_event_oid_and_pilot_oid(:evento_oid, p.o' +
        'id, :campeonato_oid) as puntos_acumulados   '
      #9#9#9#9#9#9#9'  '
      '    from inscripcion_piloto_evento ipe'
      '         join piloto p on ipe.piloto_oid = p.oid'
      '         join evento eve on eve.oid = ipe.evento_oid'
      '         left join puntos_piloto_evento ppe_sel on '
      
        #9'  ppe_sel.piloto_oid = ipe.piloto_oid and ppe_sel.evento_oid = ' +
        'ipe.evento_oid  '
      '         join localidad l on p.localidad_oid = l.oid'
      
        '         join modelo_moto mm on p.modelo_moto_oid = mm.oid      ' +
        '    '
      #9'  '
      
        'WHERE eve.fecha <= (select fecha from evento e where e.oid = :ev' +
        'ento_oid)'
      'AND eve.campeonato_oid = :campeonato_oid'
      'AND (:categoria_oid is null or :categoria_oid = 0 or'
      
        '      sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_ca' +
        'tegoria_oid, :evento_oid, p.oid) = :categoria_oid)'
      
        'AND sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_c' +
        'ategoria_oid, eve.oid, p.oid) = :nombre_categoria'
      'HAVING puntos_acumulados > 0'
      
        'ORDER BY nombre_categoria, puntos_acumulados desc, punto_fecha d' +
        'esc, puesto_evento_anterior, ipe.oid; ')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'campeonato_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nombre_categoria'
        ParamType = ptUnknown
      end>
    Left = 432
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'campeonato_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nombre_categoria'
        ParamType = ptUnknown
      end>
  end
  object DSSelectReporteEvento: TDataSource
    DataSet = ZSelectReporteEvento
    Left = 552
    Top = 232
  end
  object ZEventos: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select eve.*, camp.nombre as nombre_campeonato'
      'from evento eve'
      '     join campeonato camp on eve.campeonato_oid = camp.oid '
      
        'where eve.fecha <= (select fecha from evento where oid = :evento' +
        '_oid)'
      
        ' and eve.campeonato_oid = (select campeonato_oid from evento whe' +
        're oid = :evento_oid)'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 472
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object DSEventos: TDataSource
    DataSet = ZEventos
    Left = 520
    Top = 376
  end
end
