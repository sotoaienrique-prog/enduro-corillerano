object ReportMotos: TReportMotos
  Left = 0
  Top = 0
  Caption = 'ReportMotos'
  ClientHeight = 564
  ClientWidth = 1026
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
    ReportTitle = 'Reporte de Motos'
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
        Top = 0
        Width = 737
        Height = 25
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          0.000000000000000000
          1949.979166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Reporte de Motos'
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
        Width = 67
        Height = 25
        Size.Values = (
          66.145833333333340000
          1486.958333333333000000
          0.000000000000000000
          177.270833333333300000)
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
      object QRExpr2: TQRExpr
        Left = 631
        Top = 0
        Width = 55
        Height = 25
        Size.Values = (
          66.145833333333340000
          1669.520833333333000000
          0.000000000000000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        Color = clGray
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'DATE'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
    end
    object bDetail: TQRBand
      Left = 38
      Top = 84
      Width = 740
      Height = 22
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
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
        Left = 312
        Top = 4
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          10.583333333333330000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'puntos_extra'
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
        Left = 0
        Top = 4
        Width = 313
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          10.583333333333330000
          828.145833333333200000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZSelectReporteEvento
        DataField = 'nombre'
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
      Top = 65
      Width = 740
      Height = 19
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clGray
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep
      ReprintOnNewPage = False
      object lblPiloto: TQRLabel
        Left = 312
        Top = 0
        Width = 81
        Height = 18
        Size.Values = (
          47.625000000000000000
          825.500000000000100000
          0.000000000000000000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Puntos Extra'
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
        Left = 0
        Top = 0
        Width = 306
        Height = 18
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
          0.000000000000000000
          809.625000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Nombre Moto'
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
      Top = 106
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
        Left = 640
        Top = 6
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          1693.333333333333000000
          15.875000000000000000
          248.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'PAGENUMBER'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblPagina: TQRLabel
        Left = 589
        Top = 6
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1558.395833333333000000
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
  end
  object ZSelectReporteEvento: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnection
    SQL.Strings = (
      'select mm.oid, mm.nombre, mm.puntos_extra'
      'from modelo_moto mm')
    Params = <>
    Left = 344
    Top = 248
  end
  object DSSelectReporteEvento: TDataSource
    DataSet = ZSelectReporteEvento
    Left = 376
    Top = 248
  end
end
