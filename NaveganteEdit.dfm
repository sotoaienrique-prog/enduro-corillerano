inherited NaveganteEditor: TNaveganteEditor
  Caption = 'Editor de Navegantes'
  ClientHeight = 462
  ExplicitTop = -38
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited buttonPanel: TPanel
    Top = 425
  end
  inherited mainPanel: TPanel
    Height = 384
    object userDataGB: TGroupBox
      Left = 1
      Top = 1
      Width = 482
      Height = 152
      Align = alTop
      Caption = ' Datos Contacto '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 485
      DesignSize = (
        482
        152)
      object lblNombre: TcxLabel
        Left = 12
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
        Left = 69
        Top = 29
        Anchors = [akTop]
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
        Width = 180
      end
      object lblApellido: TcxLabel
        Left = 266
        Top = 31
        Anchors = [akTop]
        Caption = 'Apellido:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        ExplicitLeft = 315
      end
      object txtApellido: TcxTextEdit
        Left = 322
        Top = 27
        Anchors = [akTop]
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
        ExplicitLeft = 388
        Width = 148
      end
      object lblDireccion: TcxLabel
        Left = 6
        Top = 58
        Caption = 'Direcci'#243'n:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtDireccion: TcxTextEdit
        Left = 69
        Top = 57
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 403
      end
      object lblTelefono: TcxLabel
        Left = 20
        Top = 85
        Caption = 'Celular:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
      end
      object lblMail: TcxLabel
        Left = 28
        Top = 112
        Caption = 'Email:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
      end
      object txtMail: TcxTextEdit
        Left = 69
        Top = 111
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 5
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 401
      end
      object txtTelefono: TcxTextEdit
        Left = 69
        Top = 85
        Anchors = [akTop]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        Width = 180
      end
      object lblTelFijo: TcxLabel
        Left = 273
        Top = 85
        Anchors = [akTop]
        Caption = 'Fijo:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
        ExplicitLeft = 306
      end
      object txtTelefonoFijo: TcxTextEdit
        Left = 304
        Top = 83
        Anchors = [akTop]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        OnExit = txtNombreExit
        OnKeyUp = txtNombreKeyUp
        ExplicitLeft = 349
        Width = 166
      end
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
