inherited PuntosEditor: TPuntosEditor
  Caption = 'Editor de Puntos'
  ClientHeight = 462
  ExplicitWidth = 500
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited buttonPanel: TPanel
    Top = 425
  end
  inherited mainPanel: TPanel
    Height = 384
    ExplicitLeft = -2
    ExplicitHeight = 384
    object lblPuesto: TcxLabel
      Left = 72
      Top = 39
      Caption = 'Puesto: '
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lblPuntos: TcxLabel
      Left = 70
      Top = 75
      Caption = 'Puntos:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lblPuntosExtra: TcxLabel
      Left = 38
      Top = 111
      Caption = 'Puntos Extra:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object txtPuesto: TcxCurrencyEdit
      Left = 128
      Top = 38
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
      OnExit = txtPuestoExit
      OnKeyUp = txtPuestoKeyUp
      Width = 65
    end
    object txtPuntos: TcxCurrencyEdit
      Left = 128
      Top = 74
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0;'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      OnExit = txtPuestoExit
      OnKeyUp = txtPuestoKeyUp
      Width = 65
    end
    object txtPuntosExtra: TcxCurrencyEdit
      Left = 128
      Top = 110
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
      OnExit = txtPuestoExit
      OnKeyUp = txtPuestoKeyUp
      Width = 65
    end
  end
  inherited validationPanel: TPanel
    Top = 384
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
end
