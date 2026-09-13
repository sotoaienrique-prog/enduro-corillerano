inherited MotoEditor: TMotoEditor
  Caption = 'Editor de Motos'
  ClientHeight = 212
  Constraints.MaxHeight = 250
  Constraints.MinHeight = 250
  ExplicitWidth = 500
  ExplicitHeight = 250
  PixelsPerInch = 96
  TextHeight = 13
  inherited buttonPanel: TPanel
    Top = 175
    ExplicitTop = 125
  end
  inherited mainPanel: TPanel
    Height = 134
    ExplicitHeight = 84
    object gbDatosGenerales: TGroupBox
      Left = 1
      Top = 1
      Width = 482
      Height = 132
      Align = alClient
      Caption = ' Datos Generales '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitHeight = 96
      DesignSize = (
        482
        132)
      object lblNombre: TcxLabel
        Left = 28
        Top = 30
        Caption = 'Modelo:'
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
        Width = 374
      end
      object lblPtosExtra: TcxLabel
        Left = 11
        Top = 71
        Caption = 'Ptos. Extra:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtPtosExtra: TcxCurrencyEdit
        Left = 85
        Top = 70
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
        TabOrder = 3
        OnExit = txtNombreExit
        OnKeyDown = txtNombreKeyUp
        OnKeyUp = txtNombreKeyUp
        Width = 91
      end
    end
  end
  inherited validationPanel: TPanel
    Top = 134
    ExplicitTop = 84
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
