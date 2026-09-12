inherited CampeonatoEditor: TCampeonatoEditor
  Caption = 'Editor de Campeonato'
  ClientHeight = 162
  Constraints.MinHeight = 200
  ExplicitWidth = 500
  ExplicitHeight = 200
  PixelsPerInch = 96
  TextHeight = 13
  inherited buttonPanel: TPanel
    Top = 125
  end
  inherited mainPanel: TPanel
    Height = 84
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
      TabOrder = 1
      OnExit = txtNombreExit
      OnKeyUp = txtNombreKeyUp
      Width = 374
    end
  end
  inherited validationPanel: TPanel
    Top = 84
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
