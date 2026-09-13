object ReportePuestoEvento: TReportePuestoEvento
  Left = 0
  Top = 0
  Caption = 'FPreview'
  ClientHeight = 547
  ClientWidth = 1271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep: TQuickRep
    Left = 0
    Top = 0
    Width = 816
    Height = 1056
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
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
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
    ReportTitle = 'Clasificaci'#243'n de Pilotos por Evento'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object bTitle: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 59
      AlignToBottom = False
      Color = clGray
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        156.104166666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object lblTitle: TQRLabel
        Left = 0
        Top = 0
        Width = 321
        Height = 25
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          0.000000000000000000
          849.312499999999900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Clasificaci'#243'n Campeonato Hasta:'
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
        Left = 327
        Top = 0
        Width = 410
        Height = 25
        Size.Values = (
          66.145833333333340000
          865.187500000000000000
          0.000000000000000000
          1084.791666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clGray
        DataSet = ZSelectEvento
        DataField = 'nombre_evento'
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
      object QRLabel1: TQRLabel
        Left = 169
        Top = 27
        Width = 66
        Height = 25
        Size.Values = (
          66.145833333333340000
          447.145833333333400000
          71.437500000000000000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha:'
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
      object QRDBText1: TQRDBText
        Left = 241
        Top = 27
        Width = 146
        Height = 25
        Size.Values = (
          66.145833333333340000
          637.645833333333400000
          71.437500000000000000
          386.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clGray
        DataSet = ZSelectEvento
        DataField = 'fecha_evento'
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
      object QRLabel2: TQRLabel
        Left = 401
        Top = 28
        Width = 112
        Height = 25
        Size.Values = (
          66.145833333333340000
          1060.979166666667000000
          74.083333333333340000
          296.333333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nro. Fecha:'
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
      object QRDBText2: TQRDBText
        Left = 519
        Top = 27
        Width = 154
        Height = 25
        Size.Values = (
          66.145833333333340000
          1373.187500000000000000
          71.437500000000000000
          407.458333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clGray
        DataSet = ZSelectEvento
        DataField = 'nro_fecha_evento'
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
    object bDetail: TQRBand
      Left = 38
      Top = 138
      Width = 740
      Height = 22
      Frame.DrawTop = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = bDetailBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333340000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object txtLocalidad: TQRDBText
        Left = 455
        Top = 2
        Width = 150
        Height = 17
        Size.Values = (
          44.979166666666670000
          1203.854166666667000000
          5.291666666666667000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'localidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object lblPosValue: TQRLabel
        Left = 1
        Top = 3
        Width = 58
        Height = 15
        Size.Values = (
          40.569444444444450000
          1.763888888888889000
          7.055555555555556000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Caption = 'lblPosValue'
        Color = clWhite
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
      object txtPiloto: TQRDBText
        Left = 171
        Top = 2
        Width = 185
        Height = 17
        Size.Values = (
          44.979166666666670000
          452.437500000000000000
          5.291666666666667000
          489.479166666666600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'nombre_apellido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object txtNroMoto: TQRDBText
        Left = 108
        Top = 3
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          285.750000000000000000
          7.937500000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'nro_moto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object txtModeloMoto: TQRDBText
        Left = 362
        Top = 2
        Width = 92
        Height = 17
        Size.Values = (
          44.979166666666670000
          957.791666666666800000
          5.291666666666667000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'nombre_moto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object txtPuntosAcumulados: TQRDBText
        Left = 61
        Top = 2
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          161.395833333333300000
          5.291666666666667000
          116.416666666666700000)
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object txtPuestoFecha: TQRDBText
        Left = 608
        Top = 2
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          5.291666666666667000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'puesto_fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object txtFecha: TQRDBText
        Left = 668
        Top = 1
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1767.416666666667000000
          2.645833333333333000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'punto_fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object bGroup: TQRGroup
      Left = 38
      Top = 97
      Width = 740
      Height = 41
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = bGroupBeforePrint
      Color = clGray
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        108.479166666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'ZSelectReporteEvento.nombre_categoria'
      Master = QuickRep
      ReprintOnNewPage = False
      object lblPosicion: TQRLabel
        Left = 1
        Top = 21
        Width = 58
        Height = 18
        Size.Values = (
          47.625000000000000000
          1.763888888888889000
          55.562500000000000000
          153.458333333333300000)
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
      object txtNombreCategoria: TQRDBText
        Left = 0
        Top = -1
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          -2.645833333333333000
          1957.916666666667000000)
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
      object lblLocalidad: TQRLabel
        Left = 455
        Top = 21
        Width = 150
        Height = 18
        Size.Values = (
          47.625000000000000000
          1203.854166666667000000
          55.562500000000000000
          396.875000000000000000)
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
      object lblPiloto: TQRLabel
        Left = 169
        Top = 21
        Width = 187
        Height = 18
        Size.Values = (
          47.625000000000000000
          447.145833333333400000
          55.562500000000000000
          494.770833333333400000)
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
      object lblNroMoto: TQRLabel
        Left = 108
        Top = 21
        Width = 57
        Height = 18
        Size.Values = (
          47.625000000000000000
          285.750000000000000000
          55.562500000000000000
          150.812500000000000000)
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
      object lblModeloMoto: TQRLabel
        Left = 362
        Top = 21
        Width = 92
        Height = 18
        Size.Values = (
          47.625000000000000000
          957.791666666666800000
          55.562500000000000000
          243.416666666666700000)
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
      object lblPuntosAcumulados: TQRLabel
        Left = 61
        Top = 21
        Width = 44
        Height = 18
        Size.Values = (
          47.625000000000000000
          161.395833333333300000
          55.562500000000000000
          116.416666666666700000)
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
      object lblPuntosFecha: TQRLabel
        Left = 668
        Top = 21
        Width = 65
        Height = 18
        Size.Values = (
          47.625000000000000000
          1767.416666666667000000
          55.562500000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha'
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
      object lblPuestoFecha: TQRLabel
        Left = 606
        Top = 21
        Width = 65
        Height = 18
        Size.Values = (
          47.625000000000000000
          1603.375000000000000000
          55.562500000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Puesto'
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
    object bFooter: TQRBand
      Left = 38
      Top = 160
      Width = 740
      Height = 33
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        87.312500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRExpr1: TQRExpr
        Left = 677
        Top = 6
        Width = 41
        Height = 19
        Size.Values = (
          50.270833333333330000
          1791.229166666667000000
          15.875000000000000000
          108.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'PAGENUMBER'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object lblPagina: TQRLabel
        Left = 621
        Top = 6
        Width = 50
        Height = 18
        Size.Values = (
          47.625000000000000000
          1643.062500000000000000
          15.875000000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'P'#225'gina:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
    end
  end
  object ZSelectReporteEvento: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select distinct sel_nro_moto_by_tipo_categoria(ipe.tipo_categori' +
        'a_oid, p.oid) as nro_moto, CONCAT(p.apellido, '#39', '#39' , p.nombre) a' +
        's nombre_apellido, '
      
        ' l.localidad, mm.nombre as nombre_moto, sel_nombre_categoria_by_' +
        'tipo_categoria(ipe.tipo_categoria_oid, p.oid) as nombre_categori' +
        'a,'
      
        '    sel_puntos_by_event_oid_and_pilot_oid(:evento_oid, ipe.pilot' +
        'o_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_t' +
        'ipo_categoria(ipe.tipo_categoria_oid, :evento_oid, p.oid)) punto' +
        '_fecha,'
      
        '    sel_puesto_by_event_oid_and_pilot_oid(:evento_oid, ipe.pilot' +
        'o_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_t' +
        'ipo_categoria(ipe.tipo_categoria_oid, :evento_oid, p.oid)) puest' +
        'o_fecha,'
      
        '    sel_total_puntos_by_event_oid_and_pilot_oid(:evento_oid, ipe' +
        '.piloto_oid, :campeonato_oid, ipe.tipo_categoria_oid, sel_catego' +
        'ria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, :ev' +
        'ento_oid, p.oid))  puntos_acumulados,'
      
        '    sel_puesto_by_event_oid_and_pilot_oid(select_evento_previo_b' +
        'y_evento_oid(:evento_oid), p.oid, ipe.tipo_categoria_oid, sel_ca' +
        'tegoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid,' +
        ' :evento_oid, p.oid)) as puesto_evento_anterior'
      #9#9#9#9#9#9#9'  '
      '    from inscripcion_piloto_evento ipe'
      #9#9' join piloto p on ipe.piloto_oid = p.oid'
      #9#9' join evento eve on eve.oid = ipe.evento_oid'
      #9#9' left join puntos_piloto_evento ppe_sel on '
      
        #9#9#9'  ppe_sel.piloto_oid = ipe.piloto_oid and ppe_sel.evento_oid ' +
        '= ipe.evento_oid  '
      '         join localidad l on p.localidad_oid = l.oid'
      
        '         join modelo_moto mm on p.modelo_moto_oid = mm.oid      ' +
        '    '
      'where p.oid in '
      '      (select distinct p2.oid'
      '              from inscripcion_piloto_evento ipe2'
      '              '#9#9' join piloto p2 on ipe2.piloto_oid = p2.oid'
      '               '#9#9' join evento eve2 on eve2.oid = ipe2.evento_oid'
      
        '              where eve2.fecha <= (select fecha from evento e wh' +
        'ere e.oid = :evento_oid)'
      '              and eve2.campeonato_oid = :campeonato_oid'
      
        '              and (:categoria_oid is null or :categoria_oid = 0 ' +
        'or'
      
        '               sel_categoria_oid_by_evento_and_tipo_categoria(ip' +
        'e2.tipo_categoria_oid, :evento_oid, p2.oid) = :categoria_oid))'
      'having puntos_acumulados > 0'
      
        'order by nombre_categoria, puntos_acumulados desc, punto_fecha d' +
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
      end>
    Left = 264
    Top = 432
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
      end>
  end
  object DSSelectReporteEvento: TDataSource
    DataSet = ZSelectReporteEvento
    Left = 416
    Top = 432
  end
  object DSEvento: TDataSource
    DataSet = ZSelectEvento
    Left = 384
    Top = 488
  end
  object ZSelectEvento: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select e.nro_fecha as nro_fecha_evento, e.fecha as fecha_evento,' +
        ' e.nombre as nombre_evento '
      'from evento e'
      'where e.oid = :evento_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 264
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
end
