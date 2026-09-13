object ReportPuntuacionEvento: TReportPuntuacionEvento
  Left = 0
  Top = 0
  Caption = 'ReportPuntuacionEvento'
  ClientHeight = 506
  ClientWidth = 867
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
  object QuickRep: TQuickRep
    Left = 0
    Top = 0
    Width = 816
    Height = 1056
    DataSet = ZSelectReportePuntuacion
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
      Width = 740
      Height = 27
      AlignToBottom = False
      Color = clGray
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.437500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object lblTitle: TQRLabel
        Left = 0
        Top = 1
        Width = 257
        Height = 25
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          2.645833333333333000
          679.979166666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Clasificaci'#243'n de la Fecha:'
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
      object QRLabel2: TQRLabel
        Left = 562
        Top = 0
        Width = 65
        Height = 25
        Size.Values = (
          66.145833333333340000
          1486.958333333333000000
          0.000000000000000000
          171.979166666666700000)
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
      object txtEvento: TQRDBText
        Left = 263
        Top = 0
        Width = 293
        Height = 25
        Size.Values = (
          66.145833333333340000
          695.854166666666800000
          0.000000000000000000
          775.229166666666800000)
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
      object QRDBText3: TQRDBText
        Left = 626
        Top = 1
        Width = 111
        Height = 25
        Size.Values = (
          66.145833333333340000
          1656.291666666667000000
          2.645833333333333000
          293.687500000000000000)
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
    end
    object bDetail: TQRBand
      Left = 38
      Top = 106
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
      object txtPiloto: TQRDBText
        Left = 127
        Top = 4
        Width = 267
        Height = 17
        Size.Values = (
          44.979166666666670000
          336.020833333333400000
          10.583333333333330000
          706.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = ZSelectReportePuntuacion
        DataField = 'nombre_piloto'
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
        Left = 64
        Top = 4
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          10.583333333333330000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReportePuntuacion
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
        Left = 400
        Top = 4
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          10.583333333333330000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReportePuntuacion
        DataField = 'modelo_moto'
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
        Left = 680
        Top = 4
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          1799.166666666667000000
          10.583333333333330000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReportePuntuacion
        DataField = 'puntos'
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
      object txtPuestoAcumulados: TQRDBText
        Left = 616
        Top = 4
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          10.583333333333330000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReportePuntuacion
        DataField = 'puesto'
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
      object QRDBText1: TQRDBText
        Left = 480
        Top = 4
        Width = 130
        Height = 17
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          10.583333333333330000
          343.958333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = ZSelectReportePuntuacion
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
      object QRDBText2: TQRDBText
        Left = 0
        Top = 4
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          10.583333333333330000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReportePuntuacion
        DataField = 'puesto'
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
    end
    object bFooter: TQRBand
      Left = 38
      Top = 128
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
        Left = 664
        Top = 6
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1756.833333333333000000
          15.875000000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'PAGENUMBER'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblPagina: TQRLabel
        Left = 613
        Top = 6
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1621.895833333333000000
          15.875000000000000000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'P'#225'gina:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object bGroup: TQRGroup
      Left = 38
      Top = 65
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
      Expression = 'ZSelectReportePuntuacion.nombre_categoria'
      Master = QuickRep
      ReprintOnNewPage = False
      object lblPosicion: TQRLabel
        Left = 616
        Top = 21
        Width = 58
        Height = 18
        Size.Values = (
          47.625000000000000000
          1629.833333333333000000
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
        DataSet = ZSelectReportePuntuacion
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
      object lblPiloto: TQRLabel
        Left = 127
        Top = 21
        Width = 267
        Height = 18
        Size.Values = (
          47.625000000000000000
          336.020833333333400000
          55.562500000000000000
          706.437500000000000000)
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
        Left = 64
        Top = 21
        Width = 57
        Height = 18
        Size.Values = (
          47.625000000000000000
          169.333333333333300000
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
        Left = 400
        Top = 21
        Width = 74
        Height = 18
        Size.Values = (
          47.625000000000000000
          1058.333333333333000000
          55.562500000000000000
          195.791666666666700000)
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
        Left = 680
        Top = 21
        Width = 49
        Height = 18
        Size.Values = (
          47.625000000000000000
          1799.166666666667000000
          55.562500000000000000
          129.645833333333300000)
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
      object lblLocalidad: TQRLabel
        Left = 480
        Top = 23
        Width = 130
        Height = 18
        Size.Values = (
          47.625000000000000000
          1270.000000000000000000
          60.854166666666680000
          343.958333333333400000)
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
      object QRLabel1: TQRLabel
        Left = 0
        Top = 21
        Width = 58
        Height = 18
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
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
    end
  end
  object ZSelectReportePuntuacion: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      
        'select ipe.oid, CONCAT(p.apellido, '#39', '#39' , p.nombre) as nombre_pi' +
        'loto, '
      '       p.oid as piloto_oid, e.oid as evento_oid, '
      
        '       sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tip' +
        'o_categoria_oid, ipe.evento_oid, p.oid) as nombre_categoria,'
      
        '       sel_puntos_by_event_oid_and_pilot_oid(ipe.evento_oid, ipe' +
        '.piloto_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento' +
        '_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, p.oi' +
        'd)) puntos, '
      
        '       sel_puesto_by_event_oid_and_pilot_oid(ipe.evento_oid, ipe' +
        '.piloto_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento' +
        '_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, p.oi' +
        'd)) puesto,'
      
        '       sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_catego' +
        'ria_oid, ipe.evento_oid, p.oid) as nro_moto, '
      '       mm.nombre as modelo_moto, mm.puntos_extra, l.localidad'
      'from inscripcion_piloto_evento ipe '
      '     join evento e on ipe.evento_oid = e.oid'
      '     join campeonato c on e.campeonato_oid = c.oid'
      '     join piloto p on ipe.piloto_oid = p.oid'
      '     left join modelo_moto mm on p.modelo_moto_oid = mm.oid    '
      '     left join localidad l on p.localidad_oid = l.oid'
      'where e.oid = :evento_oid AND'
      '      (:categoria_oid is null or :categoria_oid = 0 or'
      
        '               sel_categoria_oid_by_evento_and_tipo_categoria(ip' +
        'e.tipo_categoria_oid, :evento_oid, p.oid) = :categoria_oid)'
      'order by nombre_categoria, puesto, puntos desc')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
    Left = 288
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
  end
  object DSSelectReportePuntuacion: TDataSource
    DataSet = ZSelectReportePuntuacion
    Left = 288
    Top = 160
  end
  object DSEvento: TDataSource
    DataSet = ZSelectEvento
    Left = 376
    Top = 304
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
    Left = 344
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
end
