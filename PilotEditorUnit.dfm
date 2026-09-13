inherited PilotEditor: TPilotEditor
  Caption = 'Editor de Pilotos'
  ClientHeight = 631
  ClientWidth = 667
  OnActivate = FormActivate
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnShow = FormShow
  ExplicitTop = -84
  ExplicitWidth = 683
  ExplicitHeight = 669
  PixelsPerInch = 96
  TextHeight = 13
  inherited buttonPanel: TPanel
    Top = 594
    Width = 667
    ExplicitTop = 594
    ExplicitWidth = 667
    DesignSize = (
      667
      37)
    inherited btnAccept: TAeroButton
      Left = 565
      ModalResult = 1
      ExplicitLeft = 565
    end
    inherited btnCancel: TAeroButton
      Left = 465
      ExplicitLeft = 465
    end
  end
  inherited mainPanel: TPanel
    Width = 667
    Height = 543
    ExplicitWidth = 667
    ExplicitHeight = 543
    object userDataGB: TGroupBox
      Left = 1
      Top = 1
      Width = 665
      Height = 195
      Align = alTop
      Caption = ' Datos Piloto '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        665
        195)
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
        Top = 27
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnExit = notasMemoExit
        OnKeyUp = textKeyUp
        Width = 331
      end
      object lblApellido: TcxLabel
        Left = 441
        Top = 31
        Anchors = [akTop, akRight]
        Caption = 'Apellido:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtApellido: TcxTextEdit
        Left = 497
        Top = 27
        Anchors = [akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnExit = notasMemoExit
        OnKeyUp = textKeyUp
        Width = 148
      end
      object lblNroDoc: TcxLabel
        Left = 7
        Top = 56
        Caption = 'Nro. Documento:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtNroDoc: TcxMaskEdit
        Left = 112
        Top = 53
        Anchors = [akLeft, akTop, akRight]
        Properties.BeepOnError = True
        Properties.EditMask = '00\.000\.000;1;_'
        Properties.OnValidate = txtNroDocPropertiesValidate
        TabOrder = 2
        Text = '  .   .   '
        OnExit = notasMemoExit
        OnKeyUp = textKeyUp
        Width = 155
      end
      object dtpFechaNac: TAdvDateTimePicker
        Left = 374
        Top = 55
        Width = 136
        Height = 22
        Anchors = [akTop, akRight]
        Date = 41450.697465277780000000
        Time = 41450.697465277780000000
        DoubleBuffered = True
        Kind = dkDate
        ParentDoubleBuffered = False
        TabOrder = 3
        OnChange = dtpFechaNacChange
        OnExit = dtpFechaNacExit
        OnKeyUp = dtpFechaNacKeyUp
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 41450.697465277780000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
      end
      object lblFechaNacimiento: TcxLabel
        Left = 276
        Top = 55
        Anchors = [akTop, akRight]
        Caption = 'Fecha de Nac.:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lblDireccion: TcxLabel
        Left = 6
        Top = 82
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
        Top = 79
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        OnExit = notasMemoExit
        OnKeyUp = textKeyUp
        Width = 576
      end
      object lblTelefono: TcxLabel
        Left = 20
        Top = 109
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
        Left = 422
        Top = 167
        Anchors = [akTop, akRight]
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
        Left = 467
        Top = 166
        Anchors = [akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 10
        OnExit = notasMemoExit
        OnKeyUp = textKeyUp
        Width = 179
      end
      object cmbProvincia: TDBLookupComboBox
        Left = 70
        Top = 135
        Width = 328
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'provincia'
        ListSource = DSProvincia
        ParentFont = False
        TabOrder = 7
      end
      object lblProvincia: TcxLabel
        Left = 8
        Top = 136
        Caption = 'Provincia:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lblLocalidad: TcxLabel
        Left = 404
        Top = 136
        Anchors = [akTop, akRight]
        Caption = 'Localidad:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbLocalidad: TDBLookupComboBox
        Left = 467
        Top = 136
        Width = 179
        Height = 24
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'localidad'
        ListSource = DSLocalidad
        ParentFont = False
        TabOrder = 8
        OnExit = cmbProvinciaExit
      end
      object txtTelefono: TcxTextEdit
        Left = 69
        Top = 108
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 5
        OnExit = notasMemoExit
        OnKeyDown = txtTelefonoKeyDown
        OnKeyUp = textKeyUp
        Width = 329
      end
      object lblTagID: TcxLabel
        Left = 18
        Top = 166
        Caption = 'Tag ID:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtTagID: TcxTextEdit
        Left = 70
        Top = 165
        Anchors = [akLeft, akTop, akRight]
        BeepOnEnter = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 9
        OnExit = notasMemoExit
        OnKeyDown = txtTelefonoKeyDown
        OnKeyUp = textKeyUp
        Width = 328
      end
      object lblTelFijo: TcxLabel
        Left = 434
        Top = 107
        Anchors = [akTop, akRight]
        Caption = 'Fijo:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
      end
      object txtTelefonoFijo: TcxTextEdit
        Left = 466
        Top = 107
        Anchors = [akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 6
        OnExit = notasMemoExit
        OnKeyDown = txtTelefonoKeyDown
        OnKeyUp = textKeyUp
        Width = 180
      end
      object lblEdad: TcxLabel
        Left = 516
        Top = 55
        Anchors = [akTop, akRight]
        Caption = 'Edad:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lblValEdad: TcxLabel
        Left = 550
        Top = 55
        Anchors = [akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
    object seguroGB: TGroupBox
      Left = 1
      Top = 423
      Width = 665
      Height = 46
      Align = alTop
      Caption = ' Datos P/ Seguro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        665
        46)
      object chkResponsabilidadCivil: TcxCheckBox
        Left = 69
        Top = 18
        OnFocusChanged = chkResponsabilidadCivilClick
        Caption = 'Responsabilidad Civil'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnClick = chkResponsabilidadCivilClick
        OnExit = chkResponsabilidadCivilClick
        OnMouseLeave = chkResponsabilidadCivilClick
        Width = 142
      end
      object cxLabel1: TcxLabel
        Left = 237
        Top = 19
        Caption = 'Tel'#233'fono Acompa'#241'ante:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
      end
      object txtTelefonoAcompaniante: TcxTextEdit
        Left = 380
        Top = 18
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnExit = notasMemoExit
        OnKeyUp = textKeyUp
        Width = 265
      end
    end
    object notasGB: TGroupBox
      Left = 1
      Top = 469
      Width = 665
      Height = 73
      Align = alClient
      Caption = ' Notas | Historial '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object notasMemo: TcxMemo
        Left = 2
        Top = 23
        Align = alBottom
        TabOrder = 0
        OnExit = notasMemoExit
        OnKeyUp = textKeyUp
        Height = 48
        Width = 661
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 16
        Width = 661
        Height = 7
        Align = alClient
        DataSource = DSHistoricoRecargoInscripcion
        Options = [dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object motosGB: TGroupBox
      Left = 1
      Top = 196
      Width = 665
      Height = 227
      Align = alTop
      Caption = ' Datos Competici'#243'n '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        665
        227)
      object lblNumMoto: TcxLabel
        Left = 25
        Top = 22
        Caption = 'N'#186' Moto Enduro:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lblTipoMoto: TcxLabel
        Left = 62
        Top = 142
        Anchors = [akTop]
        Caption = 'Tipo Moto:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbTipoMoto: TDBLookupComboBox
        Left = 127
        Top = 137
        Width = 171
        Height = 24
        Anchors = [akTop]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'nombre'
        ListSource = DSTipoMoto
        ParentFont = False
        TabOrder = 6
        OnDropDown = cmbTipoMotoDropDown
        OnExit = cmbProvinciaExit
      end
      object lblCateogoria: TcxLabel
        Left = 233
        Top = 26
        Caption = 'Categor'#237'a Enduro:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbCategoria: TDBLookupComboBox
        Left = 341
        Top = 21
        Width = 242
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'nombre'
        ListSource = DSCategoria
        ParentFont = False
        TabOrder = 1
        OnExit = cmbProvinciaExit
        OnKeyPress = cmbCategoriaKeyPress
      end
      object btnAddTipoMoto: TAeroButton
        AlignWithMargins = True
        Left = 304
        Top = 133
        Width = 34
        Height = 31
        ImageIndex = 2
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akTop, akRight]
        TabOrder = 7
        OnClick = btnAddTipoMotoClick
      end
      object txtNumMoto: TcxCurrencyEdit
        Left = 128
        Top = 22
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnExit = txtNumMotoExit
        OnKeyUp = textKeyUp
        Width = 65
      end
      object lblNumMotoCross: TcxLabel
        Left = 9
        Top = 49
        Caption = 'N'#186' Moto Motocross:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtNumMotoCross: TcxCurrencyEdit
        Left = 128
        Top = 50
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnExit = txtNumMotoExit
        OnKeyUp = textKeyUp
        Width = 65
      end
      object lblCategoriaMotocross: TcxLabel
        Left = 217
        Top = 55
        Caption = 'Categor'#237'a Motocross:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbCategoriaMotocross: TDBLookupComboBox
        Left = 341
        Top = 50
        Width = 280
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'nombre'
        ListSource = DSCategoriaMotocross
        ParentFont = False
        TabOrder = 3
        OnExit = cmbProvinciaExit
        OnKeyPress = cmbCategoriaKeyPress
      end
      object lblNumCuatriciclos: TcxLabel
        Left = 42
        Top = 78
        Caption = 'N'#186' Cuatriciclo:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtNumCuatris: TcxCurrencyEdit
        Left = 128
        Top = 79
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
        OnExit = txtNumMotoExit
        OnKeyUp = textKeyUp
        Width = 65
      end
      object lblCategoriaCuatris: TcxLabel
        Left = 213
        Top = 84
        Caption = 'Categor'#237'a Cuatriciclos:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbCategoriaCuatris: TDBLookupComboBox
        Left = 341
        Top = 79
        Width = 280
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'nombre'
        ListSource = DSCategoriaCuatriciclos
        ParentFont = False
        TabOrder = 5
        OnExit = cmbProvinciaExit
        OnKeyPress = cmbCategoriaKeyPress
      end
      object chkUtilizaHandicup: TcxCheckBox
        Left = 341
        Top = 142
        OnFocusChanged = chkUtilizaHandicupFocusChanged
        Caption = 'Utiliza Handicup'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 15
        OnClick = chkResponsabilidadCivilClick
        OnExit = chkUtilizaHandicupExit
        Width = 142
      end
      object chkEsCampeon: TcxCheckBox
        Left = 341
        Top = 169
        OnFocusChanged = chkUtilizaHandicupFocusChanged
        Caption = 'Es Campe'#243'n de la Categor'#237'a'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 16
        OnExit = chkUtilizaHandicupExit
        Width = 199
      end
      object lblRanking: TcxLabel
        Left = 71
        Top = 168
        Caption = 'Ranking:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtRanking: TcxCurrencyEdit
        Left = 127
        Top = 166
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 18
        OnExit = txtNumMotoExit
        OnKeyUp = textKeyUp
        Width = 65
      end
      object btnVerNumeracionDisponible: TAeroButton
        AlignWithMargins = True
        Left = 589
        Top = 20
        Width = 34
        Height = 28
        Hint = 'Ver numeraci'#243'n disponible'
        ImageIndex = 3
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akTop, akRight]
        TabOrder = 19
        OnClick = btnVerNumeracionDisponibleClick
      end
      object btnVerNumeracionDisponibleMotocross: TAeroButton
        AlignWithMargins = True
        Left = 627
        Top = 50
        Width = 34
        Height = 24
        Hint = 'Ver numeraci'#243'n disponible'
        ImageIndex = 3
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akTop, akRight]
        TabOrder = 20
        OnClick = btnVerNumeracionDisponibleMotocrossClick
      end
      object btnVerNumeracionDisponibleCuatri: TAeroButton
        AlignWithMargins = True
        Left = 627
        Top = 80
        Width = 34
        Height = 24
        Hint = 'Ver numeraci'#243'n disponible'
        ImageIndex = 3
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akTop, akRight]
        TabOrder = 21
        OnClick = btnVerNumeracionDisponibleCuatriClick
      end
      object btnAgregarAcompaniante: TAeroButton
        AlignWithMargins = True
        Left = 627
        Top = 20
        Width = 35
        Height = 28
        Hint = 'Agregar Acompa'#241'ante'
        ImageIndex = 4
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akTop, akRight]
        TabOrder = 22
        OnClick = btnAgregarAcompanianteClick
      end
      object cxLabel2: TcxLabel
        Left = 228
        Top = 197
        Caption = 'Categor'#237'a Anterior:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbCategoriaAnterior: TDBLookupComboBox
        Left = 341
        Top = 197
        Width = 279
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DropDownRows = 10
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'nombre'
        ListFieldIndex = 1
        ListSource = DSHistorico
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
        OnExit = cmbProvinciaExit
        OnKeyPress = cmbCategoriaKeyPress
      end
      object lblNumeroExterna: TcxLabel
        Left = 52
        Top = 107
        Caption = 'N'#186' Externo:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtNumExterno: TcxCurrencyEdit
        Left = 127
        Top = 102
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 26
        OnExit = txtNumMotoExit
        OnKeyUp = textKeyUp
        Width = 65
      end
      object lblCategoriaExterna: TcxLabel
        Left = 229
        Top = 108
        Caption = 'Categor'#237'a Externa:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cmbCategoriaExterna: TDBLookupComboBox
        Left = 340
        Top = 105
        Width = 280
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'oid'
        ListField = 'nombre'
        ListSource = DSCategoriaExterna
        ParentFont = False
        TabOrder = 28
        OnExit = cmbProvinciaExit
        OnKeyPress = cmbCategoriaKeyPress
      end
      object btnVerNumeracionDisponibleExterno: TAeroButton
        AlignWithMargins = True
        Left = 627
        Top = 106
        Width = 34
        Height = 24
        Hint = 'Ver numeraci'#243'n disponible'
        ImageIndex = 3
        Images = cxButtonImageList
        Spacing = 10
        Version = '1.0.0.1'
        Anchors = [akTop, akRight]
        TabOrder = 29
        OnClick = btnVerNumeracionDisponibleExternoClick
      end
      object lblRankingExterno: TcxLabel
        Left = 25
        Top = 194
        Caption = 'Ranking Externo:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object txtRankingExterno: TcxCurrencyEdit
        Left = 127
        Top = 192
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0;'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 31
        OnExit = txtNumMotoExit
        OnKeyUp = textKeyUp
        Width = 65
      end
    end
  end
  inherited validationPanel: TPanel
    Top = 543
    Width = 667
    Height = 51
    ExplicitTop = 543
    ExplicitWidth = 667
    ExplicitHeight = 51
    inherited errorListView: TcxListView
      Width = 667
      Height = 51
      ExplicitWidth = 667
      ExplicitHeight = 51
    end
  end
  inherited cxButtonImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 37355615
    ImageInfo = <
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
          000000000000000000000000000000000000000000000000000000000011162E
          16A6080E08790000000700000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000111F491DBF49E2
          47FF43D041FF0B140B8700000009000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000013214D1FC24DDF52FF43E8
          9BFF4AE584FF45D23EFF0E190D900000000C0000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000018245222C44ADF52FF38E491FF7BF3
          C5FF7DF0C3FF47E281FF46D643FF1021109B0000001100000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000018275524C648DF52FF27DF86FF41EAA3FF88F3
          C6FFBCF9E0FF81EEBFFF46DF80FF47D844FF152A14A600000014000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001929511FC742D145FF1FD978FF08DD78FF37E493FF61EA
          AAFF81EEBBFF93F1C6FF56E6A2FF43D978FF4ACA3CFF183013B0000000170000
          0001000000000000000000000000000000000000000000000000000000000000
          00000000001C2D521CCE3EC139FF1BD56EFF06D569FF09D56AFF15D772FF35DD
          86FF4CE193FF53E297FF4EE296FF23D979FF38D16CFF4DBB33FF1F3914BE0000
          001D000000010000000000000000000000000000000000000000000000000000
          001C30501AD139B22DFF18D063FF0ACF5DFF0ACE5BFF0ACE5BFF0BCE5DFF17D1
          64FF24D46EFF25D36DFF18D165FF0BCF5DFF03CC57FF32CB61FF4CAC29FF213C
          11C50000002200000001000000000000000000000000000000000000000B2C45
          19C934A926FF15CA57FF0CC850FF1BCA59FF36D16CFF4FD67EFF60DA8DFF66DF
          91FF6AE194FF77E09DFF70DE97FF68DC92FF49D67CFF1DCC5CFF29C352FF46A2
          23FF274214CD0000002A00000001000000000000000000000000000000143992
          33F612C143FF1FC44FFF49CF6FFF65D685FF6FD98DFF77DB94FF73E191FF3B8F
          4FE8337943DC7EE399FF95E4ACFF99E4ADFFA2E6B4FFA0E6B4FF73DB93FF3EC0
          57FF419B1EFF2D4A16D700000031000000010000000000000000000000041A34
          1FA336C751FF67D47CFF6ED483FF6FD484FF79D88DFF71DB85FF377840DE0000
          002B000000152E6034CD89E197FFA4E5B2FFA3E4AFFFAAE5B5FFB8EAC1FFAAE6
          B6FF4AB954FF3C9219FF314E18DD000000380000000100000000000000000000
          00001420148C5AC560FF77D482FF81D68AFF6FD276FF295029C60000001C0000
          0000000000000000000F254425BA8FDC92FFB5E8BBFFB2E5B7FFB8E7BCFFC2EB
          C7FFBFE9C4FF55B554FF368913FF365619E60101014500000003000000000000
          0000000000000C120B7561BC5CFF6DCA68FF1E351DB10000000D000000000000
          00000000000000000000000000071E341BAD93D68EFFC5EDC5FFC1E8C1FFC7EA
          C6FFD1EED1FFD2EFD2FF5FB257FF31800DFF3A581BED0000002F000000000000
          00000000000000000000070A075F111A108A0000000400000000000000000000
          0000000000000000000000000000000000011624139A93CE8AFFD4F0D0FFD1EC
          CDFFD5EDD2FFDFF2DCFFE2F4E0FF6FB564FF3E8620FF02020149000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000F180E8691C785FFE2F5
          DCFFDFF0D9FFE3F2DEFFF6FDF3FFCEECC8FF294F23D200000019000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000A0F097591C5
          84FFEEF9E8FFF9FEF5FFBDE1B5FF20361CB80000001100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000609
          056090C185FEA6D29CFF101A0E92000000030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000003050351060A056700000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          9E000000424D9E000000000000003E0000002800000018000000180000000100
          010000000000600000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000210505
          055C15151589292927A72B2B29AB1A1A19930707076800000030000000020000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000262222229CA2A29AEFD4D4
          C9FFC2C2C5FFA8A8BFFFA0A0BBFFADADB5FFB8B8B0FF9F9F91FA323231B60101
          0140000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000505055DA7A7A2EDEDEDE5FF8282BEFF2B2B
          C9FF0808D3FF0000DFFF0000E5FF0303DEFF1D1DD7FF5353B4FFAEAEB0FFA6A6
          9BFB111111890000000500000000000000000000000000000000000000000000
          000000000000000000000A0A0A6EEBEBE1FFC0C0D7FF1D1DBAFF0000D8FF0000
          EAFF0000EEFF0000F2FF0000F6FF0000FCFF0000FFFF0000FDFF0808DDFF7171
          B1FFC1C1B2FF1E1E1D9F00000004000000000000000000000000000000000000
          00000000000003030350E0E0D9FDA4A4CAFF0202BBFF0000D9FF1515E1FF0303
          E4FF0000EAFF0000EFFF0000F4FF0000F8FF0000FBFF0000FEFF0000FFFF0000
          F2FF5555B3FFC0C0B2FF0F0F0F84000000000000000000000000000000000000
          00000000001B878784DCC1C1D2FF0303B3FF0000CDFF4C4CDFFFE8E8EFFF6D6D
          E8FF0000E9FF0000EEFF0000F4FF0000F8FF0000FCFF0000FFFF0000FEFF0000
          FFFF0000F3FF6C6CB1FFA9A99EFD010101450000000000000000000000000000
          00001414147FF4F4E9FF3535ADFF0000C5FF4D4DD9FFF7F7FBFFFAFAF1FFF2F2
          E7FF6969E8FF0000EDFF0000F2FF0000F7FF0000FAFF0000FCFF0000FCFF0000
          FAFF0000FFFF0909DAFFA9A9AEFF323231B50000000100000000000000000000
          000E797976D5B1B1C9FF0000B6FF0000C1FFBEBEF0FFFFFFFFFFF3F3F4FFECEC
          E9FFEBEBE0FF6464E7FF0000F0FF0000F3FF0000F6FF0000F9FF0000F9FF0000
          F8FF0000F7FF0000F9FF5C5CB9FFA2A294FA0000003100000000000000000101
          013AE3E3D9FF6969B4FF0000BCFF0000BDFF1F1FC9FFD9D9F6FFFFFFF9FFECEC
          ECFFE4E4E1FFE3E3D8FF6060E5FF0000F1FF0000F2FF0000F4FF0000F5FF0000
          F4FF0000F4FF0000FAFF1E1EC7FFB8B8ADFF0707076800000000000000000707
          075BE3E3DBFF6F6FB8FF0404BDFF0000BBFF0000BCFF1F1FC9FFD2D2F2FFFBFB
          F1FFE5E5E5FFDDDDDBFFDBDBD1FF6060E4FF0000EFFF0000EFFF0000F0FF0000
          F0FF0000F0FF0000F4FF0000DAFFA5A5B1FF1E1E1D9B00000000000000000F0F
          0F71D8D8D5FF9A9ACEFF5959D3FF0303B9FF0000BAFF0000BCFF1B1BCAFFD2D2
          EEFFF4F4EAFFDDDDDEFFD6D6D3FFDADACDFF6262E3FF0000EBFF0000EBFF0000
          EBFF0000ECFF0000EEFF0000E0FF9797B6FF30302DB000000000000000000D0D
          0D6DD6D6D3FF9D9DCCFF8B8BE0FF6464D4FF1111BEFF0000B9FF0000BCFF2020
          CCFFCDCDE9FFECECE2FFD6D6D6FFCFCFCDFFDADAD0FF5F5FE3FF0000E6FF0000
          E6FF0000E7FF0000E9FF0000DAFF9E9EBAFF2F2F2CAE00000000000000000505
          0554D8D8D4FFA4A4C4FF9090E2FF8E8EDEFF7B7BDAFF3B3BC9FF0808BEFF0000
          BBFF1818C9FFC1C1E1FFE4E4DBFFCECECFFFD0D0CDFFDDDDD3FF6464DFFF0000
          E0FF0000E1FF0404E6FF0C0CCAFFBABAC0FF1B1B1A9200000000000000000000
          0031C3C3C1FABDBDC8FFA2A2E5FF9292DEFF8D8DDEFF8A8ADEFF7070D9FF4848
          CFFF1616C6FF2424CBFFC3C3DDFFDADAD3FFCDCDCDFFD4D4D1FFE2E2D8FF6F6F
          E1FF1A1ADEFF1717E4FF3C3CBBFFD4D4C9FF0505055C00000000000000000000
          00065D5D5DC7C9C9C7FFB2B2DEFF9C9CE1FF9696DFFF8D8DDEFF8787DDFF8383
          DEFF7979DCFF5F5FD8FF6C6CDCFFD5D5E3FFE2E2DCFFDCDCDDFFE6E6DFFFE3E3
          E4FF4444DFFF1818D9FF8C8CC5FFAEAEA5F30000002700000000000000000000
          00000C0C0C6AD9D9D7FFBBBBC6FFAFAFE9FF9E9EE1FF9898E0FF8F8FDEFF8787
          DDFF7E7EDCFF7777DCFF6868DBFF7474DEFFD1D1E2FFE9E9DFFFE3E3E2FF7A7A
          E0FF3333E1FF3D3DBEFFE4E4E0FF2626269F0000000000000000000000000000
          00000000000B585858C4CCCCCAFFBEBED3FFAFAFEAFFA1A1E1FF9A9AE0FF9292
          DFFF8989DEFF8181DDFF7878DCFF6969DBFF7878DEFFCBCBE4FF8A8AE0FF4343
          DFFF3B3BC9FFBABAD2FFA6A6A3ED0000002D0000000000000000000000000000
          00000000000000000032A4A4A4ECC4C4C2FFBFBFD4FFB5B5EBFFA3A3E4FF9C9C
          E1FF9595E0FF8C8CDFFF8484DEFF7B7BDDFF6F6FDCFF6767DEFF5A5AE0FF5353
          C8FFAEAEC9FFE8E8E3FF06060660000000000000000000000000000000000000
          0000000000000000000003030348B0B0B0F2CBCBC8FFBDBDC6FFBBBBE2FFADAD
          E8FFA0A0E6FF9696E4FF8E8EE2FF8585E2FF7C7CE1FF7272D7FF7979C0FFCBCB
          D3FFEAEAE4FF0E0E0E7900000000000000000000000000000000000000000000
          000000000000000000000000000001010136626262CCD7D7D5FFC7C7C6FFC0C0
          C9FFB9B9D1FFA9A9D1FFA0A0D0FF9D9DCCFFA8A8CAFFBEBEC9FFECECE7FF9696
          93E50505055A0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000C0B0B0B6A5E5E5EC9C6C6
          C5FDDADAD6FFD6D6D3FFD8D8D5FFE0E0DBFFDCDCD7FF818180DC161616850000
          001D000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000070000
          0032060606570F0F0F71101010750808085E0101013D00000010000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          9E000000424D9E000000000000003E0000002800000018000000180000000100
          010000000000600000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000A0A0A252424
          24633E3E3E894E4E4E964D4C4D963C3C3C89212121680A0A0A28000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000F0F0F36626262B6CAC4CAFCD8CE
          D8FFC7C4C7FFB6BBB6FFB0B6B0FFB6B4B6FFBCB3BBFFA8A1A7FC565555B61010
          103A000000000000000000000000000000000000000000000000000000000000
          000000000000000000000202020745454592E3DCE4FEE2DEE2FF84AC82FF419E
          41FF25A42AFF1DAD26FF1EB02DFF29AC39FF41A44FFF73A07AFFB2AEB1FFB2AB
          B1FF3E3E3E990202020900000000000000000000000000000000000000000000
          000000000000020202117B7B7BBFFCF5FCFF97B993FF25941DFF0BA906FF14B8
          16FF18BC20FF15BF24FF18C22CFF1FC737FF22CC3EFF1DC53AFF2EAA44FF77A3
          7EFFBDB5BCFF605F60BD03030310000000000000000000000000000000000000
          000000000004737373BAF8F3F8FF54944BFF059500FF13AA0AFF1AAF18FF1AB4
          1DFF31BE38FF5ECC68FF61CF6FFF3BCA52FF27C746FF2DCA4EFF2BCF4DFF1DC5
          3CFF479C56FFBCB6BBFF5F5F5FC4000000070000000000000000000000000000
          00003B3B3B85FEF7FFFF5B9452FF079100FF18A006FF19A60FFF1BAD18FF15B2
          19FF9ACF9DFFE2D3E1FFE6D7E3FFA9DAB2FF25C847FF30CA55FF30CA55FF2CCB
          4DFF1BCA3AFF529E5DFFC5B9C3FF3435348E0000000000000000000000000909
          092FE0DDE1F9A7B7A3FF0F8600FF179500FF189B07FF1AA30FFF1CAA18FF17B1
          1AFFA1CCA3FFCFC8CFFFD3CDD2FFB0D6B8FF28C849FF2FCA54FF2FCA54FF2CC9
          4CFF28CB44FF18BD2FFF809F83FFABA5ABFB0C0C0C3100000000000000006060
          60A6E8E3E9FF378427FF148E00FF199100FF199705FF1B9F0EFF1DA716FF18AE
          19FF9CC79EFFC8C1C8FFCDC6CCFFABD2B1FF26C643FF2BC74BFF2CC84BFF29C7
          47FF26C640FF1FCC36FF25A832FFB2AEB2FF4E4E4EAE0000000005050515C9C7
          CAEEA5B3A1FF198200FF1A8A00FF1A8D00FF199303FF1A9B0BFF1CA314FF17AA
          16FF9AC49AFFC2BCC2FFC7C0C6FFA7CEADFF23C33CFF27C341FF28C442FF26C4
          3FFF24C43AFF21C534FF11BF20FF789E7BFF9C979CF30909092C1919194BEBE6
          EDFF73996AFF158100FF1A8600FF148700FF188E00FF189606FF1B9F0FFF16A8
          11FF97C096FFBCB6BCFFC1BAC0FFA4CBA8FF21C234FF24C239FF24C339FF23C3
          37FF1DC22FFF1CC02BFF14C520FF45A04AFFBBB0BAFF212121633D3D3D7ADFDC
          E1FF8EAD83FF2E8C12FF288A10FFB0D0A8FFBDD4B8FFB4CEB0FFAFCAACFFA9C7
          A7FFB7C0B7FFB4B2B4FFB5B4B5FFB8C0B9FFA5C7A8FFA8C9ABFFABCCAEFFAFCF
          B3FFA5D2AAFF2FC339FF12C21AFF27A52BFFBBB4BAFF3B3B3B855454548DD6D5
          D7FFA5BE9BFF7DB56AFF5AA245FFFCF8FDFFF2EDF3FFE8E3E9FFDDD9DEFFD5CF
          D5FFC7C6C7FFBCBDBCFFB4B4B4FFB4B2B4FFBCB7BCFFC1BBC0FFC5BFC5FFC9C3
          C9FFD9CED8FF48C54CFF0EBC11FF1CA81CFFB9B8B9FF4D4B4D955151518CD4D3
          D5FFAAC0A1FF95C184FFA1C893FFFFFFFFFFFDFBFEFFF7F2F8FFF0EAF2FFE7E1
          E9FFD6D4D6FFC9C9C9FFBFBFBFFFB8B6B8FFBBB3BCFFBEB6BEFFC2BBC3FFC6BE
          C6FFD5C9D5FF45C145FF0BB809FF1BA419FFBFBDBFFF4C4A4C9234343470D7D5
          D8FFB1BEABFFA1C790FF9DC48DFFCCE1C4FFD3E6CDFFB2D3A9FF96C38AFF90C1
          85FFCBD9C8FFDAD8DAFFCFCDCFFFBAC8B9FF81B97EFF80B87DFF82BB7FFF84BD
          82FF79C177FF20B41AFF12B60BFF2F9D28FFCDC6CDFF393939801313133DD8D7
          D8FFB7BBB5FFB0CFA2FFA0C491FF95BF84FF8FBD7EFF7FB76EFF54A23EFF228C
          08FFB1D2AAFFEDE8EEFFE1DBE2FFA9CDA6FF089B00FF0EA102FF10A405FF15A9
          0BFF1DAE13FF2CB320FF22B513FF5DA057FFD4CBD5FF1C1C1C580303030BAFAF
          AFE2BEBDBEFFBED3B5FFA8CA9AFFA4C795FF9DC48EFF97C287FF94C284FF84BC
          73FFD7E9D2FFFAF8FBFFF2EEF3FFC2DBBEFF42AA31FF47AF38FF4BB33CFF4AB5
          3BFF46B537FF3DB62DFF26A716FFA5B9A3FFA8A4A8E90606061E000000004A4A
          4A8ED3D2D4FFBCC2B8FFB8D3AAFFABCA9DFFA5C897FF9EC58FFF97C287FF8ABD
          7AFFDDECD8FFFFFFFFFFFDFAFEFFD5E7D1FF6CB85AFF67B856FF5DB64DFF55B5
          44FF4DB53DFF40B82FFF4D9B43FFEAE4EAFF4545459500000000000000000505
          0519B8B8B8E7BDBCBDFFC7D4C0FFB5D1A7FFAECCA1FFA8CA99FFA0C792FF94C1
          84FFE0EDDBFFFFFFFFFFFFFFFFFFDDEDD9FF71B860FF6EB95DFF66B856FF5FB7
          4EFF57BA46FF44A235FFC5CDC4FFBAB7BAEC0606061C00000000000000000000
          000023232360DCDCDCFFB7B7B7FFCCDCC4FFB7D3AAFFAFCDA2FFA9CB9BFF9DC5
          8EFFD1E4CAFFFFFFFFFFFFFFFFFFCBE4C4FF7ABA69FF77BB67FF6FBA5FFF68BB
          57FF53AD43FF99B494FFF7F3F8FF232323680000000000000000000000000000
          0000000000004C4C4C90D6D6D6FFB5B5B5FFCBD7C5FFBFD9B2FFB0CFA3FFA9CB
          9BFFA3C995FFA6CB99FFA0C992FF8EC17FFF86BF77FF80BE6FFF76BE65FF69AD
          5AFF99AF95FFF9F5F9FF49494999000000000000000000000000000000000000
          0000000000000000000151515190D6D6D7FFC1BFC1FFBCC0B9FFC4D4BCFFBDD7
          B1FFB1D2A4FFA5CC97FF9DC98EFF99C889FF93C584FF89B87CFF8FAD88FFC8CD
          C7FFF0ECF2FF4B4B4B9000000000000000000000000000000000000000000000
          000000000000000000000000000025252558B2B2B2E6D6D5D6FFC1BFC1FFBBBD
          BAFFBAC1B7FFBAC6B4FFB3C3ADFFABBAA6FFAFB9ACFFC9CAC9FFEEEAEFFFBAB9
          BAE92424245F0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000040404103A3A3A78A3A3A3DBD3D3
          D3FED8D7D9FFD9D7D9FFDCDADDFFE0DEE1FFDFDDDFFFA6A6A6DD3A3A3A790505
          0512000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101051010
          102D2727275A38383874383838762828285B0F0F0F3202020207000000000000
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
          0000000000000000000000000002030303080707061102020231191818634E4B
          48A474716BC21313125500000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000030505
          05100404031E0707073C1F1E1D6F4846439F898681D2D3D1CBF9F8F5F1FFF3EF
          EAFFF3ECDDFF7C7974C10202021E000000000000000000000000000000000000
          0000000000000000000000000001050505110D0D0C280B0B0B49282826785856
          53AE989590DCD6D2CDFDF9F5F2FFFFFFFFFFFDFDFDFFFAFBFBFFFFFFFFFFEFED
          EBFFDFD6C9FF7F7C75B104040411000000000000000000000000000000000000
          0000000000000808081513131330636362B6A5A5A4DFEDECE9FCFFFFFDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFDDDDDFFFA2A2A2FF9C9C9CFFF5F5F5FFF2F1
          EEFFD4CBBEFF8B8782B10E0E0E11000000000000000000000000000000000000
          000000000000232322404646456EFFFFFFFFFFFFFFFFEBEBEBFFC0C1C2FFB1B2
          B2FFCACBCAFFF9F9F8FFFBFBFBFFB2B1B0FF5C5E5EFF5A5957FFE9E8E7FFF4F2
          EEFFD2CABBFF85817CB10C0C0C11000000000000000000000000000000000000
          0000000000002C2C2B4251515070FFFFFFFFE4E5E4FF959595FF636363FF7171
          72FF6F6F6FFFB2B0AEFFFAFAF8FFA5A5A0FF3D3F41FF565452FFEDEBE2FFF3EF
          E4FFCDC5B5FF817E79B10C0C0C11000000000000000000000000000000000000
          000000000000272626404B4B496EFDFAF3FFAFAEABFF474848FF615F5DFF7B7B
          78FF454646FF676661FFF8F7ECFF9F9C96FF343537FF555451FFEDEBE1FFF3EF
          E1FFCCC3B3FF7F7C77B10C0C0B11000000000000000000000000000000000000
          000000000000262525404B49486EF1EBDEFF858481FF1E1E20FF9B988EFF9897
          90FF4C4C4DFF5B5B59FFF7F7F3FFB2B1B0FF5C5C5DFF616161FFE8E8E6FFF8F6
          F1FFD8D0C2FF7E7B75B10B0B0B11000000000000000000000000000000000000
          000000000000242423404847456EEAE0CFFF71706BFF191B1CFFA5A39DFFAFAE
          ABFF676768FF5F5F5FFFF7F7F7FFB4B4B4FF5E5E5EFF616161FFE7E7E8FFF8F7
          F4FFD7D0C3FF7C7873B10B0B0B11000000000000000000000000000000000000
          000000000000232222404544416EE9DDC8FF918F8AFF37373AFFA1A1A2FFACAC
          ACFF626262FF5E5E5EFFF7F7F7FFB0B0B0FF545454FF5E5E5EFFE7E8E8FFF6F4
          F2FFD2CABEFF797570B10B0B0A11000000000000000000000000000000000000
          000000000000222221404543426EEBE7DFFF969798FF353536FFA0A09FFFA9A9
          A9FF5D5D5DFF5D5D5DFFF8F8F8FFAFAFAFFF4F4F4FFF5B5B5BFFE7E8E8FFF5F3
          F0FFCEC6BAFF77736DB10B0B0A11000000000000000000000000000000000000
          000000000000222120404443426EECECE9FF909191FF303030FF9F9F9FFFA5A5
          A5FF565656FF5C5C5CFFF7F7F7FFAAAAAAFF474747FF595959FFE7E7E8FFF3F2
          EFFFCAC2B5FF74706AB10B0A0A11000000000000000000000000000000000000
          00000000000021201F404242406EECEAE7FF8B8B8DFF2A2A2AFFA2A2A2FFA5A5
          A5FF515151FF565656FFBDBDBDFF828282FF494949FF575757FFE7E8E8FFF0EF
          ECFFC5BDB0FF716E67B10A0A0A11000000000000000000000000000000000000
          000000000000201F1E4041403F6EEBE9E6FF858687FF2A2A2AFF989898FF9393
          93FF484848FF4E4E4EFF5C5C5CFF484848FF484848FF535353FFE5E5E6FFEBE8
          E6FFB6AEA3FF6E6A64B10A0A0911000000000000000000000000000000000000
          0000000000001E1D1D3F3E3C3B6DF7F4F2FF959696FF303030FF626262FF5B5B
          5BFF191919FF8E8E8EFFBFBFBFFF888888FF2F2F2FFF434343FFEBEBECFFE3E2
          E0FFA29A91FF65615CB109090911000000000000000000000000000000000000
          0000000000001C1C1C3F3A38386DFAF7F4FFE0E1E1FF6C6C6CFF2D2D2DFF2424
          24FF616161FFEEEEEEFFFFFFFFFFF4F4F5FFA2A2A3FFAFAFB0FFFFFFFFFFDDDD
          DCFF8E8881FF585551B109080811000000000000000000000000000000000000
          0000000000001B1B1A3F3837366DF1EEEBFFFFFFFFFFE8E7E8FFBBBCBEFFBCBE
          BFFFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5FFDFDEDEFF9D9C
          9AFF716C69FF52504DB308080812000000000000000000000000000000000000
          0000000000001A1A193F3635346DEFEDEAFFFFFFFFFFF8F7F6FFF3F0EFFFE8E5
          E0FFD2CDC7FFBDB7AFFFB8B0A8FFB4AAA1FFABA298FF9C948BFF8B847CFF7975
          6FFF7A7571FF474544A40606050E000000000000000000000000000000000000
          0000000000001A19193E2F2E2C6C9B8F82FF9F9488FF978B7EFF9A8E80FF9D92
          84FF9B9082FF9A8E82FF978D83F58B8178E5766E68D25E5954B24643408F3736
          34782928275F0E0E0E2100000000000000000000000000000000000000000000
          0000000000000404040B0D0D0C20504D48A9716A62D05A544FAB46433F8E3332
          306E2222214D181717370E0E0E23090909150808070E0606050B040303070101
          0103000000000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000400000012010101370E0A035B1E17057632250890413209A04836
          0AA646350AA63F3009A0302407911F17057A0D09025900000028000000040000
          0000000000000000000000000000000000000000000000000000000000020000
          000E0403024340320A9EAA8713E8DAAF11FFDEB30FFFDEB30DFFDBB10BFFD7AD
          09FFD1A707FFCEA506FFCEA405FFC59C03FFBC9305FF7E600AD9090702440000
          00000000000000000000000000000000000000000000000000000000001C291F
          0787AE8A12EBF0C314FFE8BD11FFDEB50FFFDAB10EFFD6AE0CFFD3AA0BFFD0A8
          09FFC9A208FFBF9905FFC59E05FFBF9902FFBB9500FFCAA002FF1F1705680000
          00000000000000000000000000000000000000000000000000001611045DF0C2
          1AFFDAB20FFFE6BC14FFE3B913FFE0B611FFDDB310FFD9B00EFFD6AD0DFFD3AA
          0BFFD0A80AFFC19B07FFC39C06FFC29C04FFBA9400FFBF9603FF0A08003A0000
          00000000000000000000000000000000000000000000000000001F17055FF7C9
          19FFD0A90FFFEABF16FFE6BC14FFE4B912FFE3B910FFE0B60EFFDAB10EFFD6AD
          0DFFD3AB0BFFCAA309FFC19B06FFC69F05FFBC9500FFB38C04FC100C1A7E0303
          1D6D0403217603021E7101011460000008450000001B00000000281C0B47EFC2
          1AFFD1AB0FFFEDC217FFEBC015FFEBBF11FFD0A811FFCBA410FFE0B50CFFDEB3
          0DFFD5AD0DFFD2A90BFFC8A109FFC79F06FFBE9700FFA68127FF3F30F9FF3328
          FFFF2920FFFF1E17FFFF1510FFFF0403EEFD0101A8DC0101236E100B051ADAAF
          1EF3DFB712FFF0C417FFEDC115FF8F7E37FF5F6A78FF636D78FF766B3DFFC9A3
          0FFFDFB40DFFD6AD0DFFD5AC0BFFC49D04FFC19900FF866679FF4435FFFF3F31
          FFFF3429FFFF221BF3FF1D17FCFF0907FFFF0000FFFF010181BE000000006B50
          1890F9CD19FFFFD216FFCDA91AFF607AA7FF90C2FFFF8DBDFFFF6F97D8FF5958
          45FFD4AA09FFDFB40EFFC8A209FFB79300FF9F7B45FF604AF1FF5140FFFF4839
          FFFF3F31FFFF2E24F7FF231BF3FF130FFFFF0000FFFF0202568D000000000402
          01064A35126AA88016C5BF970EF37293C3FF82B1FBFF7EABF4FF8ABBFFFF6088
          CCFF7D6813FFBE9B05FFA4830EFF93717BFF7258FCFF644DFFFF5B46FCFF5341
          FFFF4839FFFF3C2FFEFF2E24F5FF1813FFFF0000FFFF03034568000000000000
          00000000000002020205454240896580AAF74D7CCEFF6895DFFF7DABF5FF77AB
          FDFF4C5143FF977540FF7E61C7FF8669FFFF6F5AD8FF5D5F91FF5D608FFF5243
          BAFF5240FFFF4839FFFF4032FEFF120EFFFF0000EDFB01011629000000000000
          000000000000313C51748ABEFFFF8CBBFFFF72A0EEFF5684D4FF6999E7FF79A3
          E2FB372A1D7E332558899375FFFF9774FFFF666B9AFF89B9EFFF8CBBF3FF6681
          9DFF493DB0FF5743FFFF2C23FDFF0302F1FF0303486F00000000000000000000
          00000405060B7092C7DF94C1FFFF92BEFFFF8FBDFFFF73A3F4FF6393E5FF698D
          C6DE00000000000000000B0833532F227CA5515DACF376A6ECFF7DAAF4FF89BC
          FFFF495B94FF1911D5FF0202AAD602022B4A0000000000000000000000000000
          00001518213598C1FCFF9CC5FFFF9CC5FFFF9AC4FFFF88B5FCFF6B9BF1FF668B
          C7DD0102030400000000000000001C2A506D658AD1EB5B89D6FF5E8CD8FF7FB1
          FBFF4A67A8F90000478B0000060C000000000000000000000000000000000000
          00002D364A6AAED2FFFFA4CAFFFFA3C9FFFFA4CAFFFF99C3FFFF72A2F5FF5B82
          CAF60F10133400000000070C1B2787B3F5FB98C6FFFF8BB9FFFF6594E6FF71A1
          EBFF24335F800000000000000000000000000000000000000000000000000000
          00004A597699BEDDFFFFA9CEFFFFACCFFFFFAED1FFFFA5CCFFFF7CABFAFF6490
          E3FF1E2026D201010206212F52679AC6FFFF90BDFFFF92BFFFFF80AEF9FF71A1
          F0FF1F2E4D5F0000000000000000000000000000000000000000000000000000
          0000607596B2CBE5FFFFB7D6FFFFBDDAFFFFC3DDFFFFB6D8FFFF5B78A5FF4D6C
          A7FF232B38FF090B12503D517A91A6CFFFFF98C2FFFF99C3FFFF91BDFEFF70A0
          F6FF273963A80000000100000000000000000000000000000000000000000000
          0000596985A3E6F7FFFFD4E9FFFFDBEBFFFFE2F0FFFFC9E6FFFF54657DFF0000
          00FF0C0B07FF10141E7A617AA4B7B2D6FFFFA6CBFFFFACCFFFFF9EC6FEFF719E
          EEFF455E8AFF0507135A00000000000000000000000000000000000000000000
          00002B313F68CEDEECFFDBEFFFFFF6FFFFFFFCFFFFFFB9D8FFFF49515DFF0705
          03FF0F0D0AFF0F131E78728AAFBEC5E2FFFFBFDAFFFFCBE2FFFFADCFFEFF3847
          5EFF151D2AFF0F1118B900000000000000000000000000000000000000000404
          0512262729D3383B40FF47515EFF7B8CA1FF8DA5C0FF5F6E84FF4A4946FF2727
          26FF191814FF080A114645557693D2ECFFFFE6F7FFFFF8FFFFFFADCBF5FF2D30
          33FF000000FF101319BF00000000000000000000000000000000000000000505
          061939393BC06A6968FF575654FF3C3B3AFF222222FF070603FF4F4F4FFF5151
          50FF252425CB06060A242F333FE2515A63FF707B88FF8A9DAFFF606C7DFF4140
          3EFF1F1E1AFF0B0E1B8F00000000000000000000000000000000000000000000
          0000000000000A0A0C402020229D333435D82B2B2CF1141414F8111113D71415
          17780404051602030610282B35A6535252F142403DFF22211FFF0E0D09FF4C4B
          4AFF2F3033DE03050C2600000000000000000000000000000000000000000000
          0000000000000000000000000000010101050303041904040521010101070000
          00000000000000000000000000000203071E0C0F176516181EA30C0D13B00507
          0F5E0101030E0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  inherited BindingsList: TBindingsList
    Left = 256
    Top = 496
  end
  inherited BindScope: TBindScope
    Left = 312
    Top = 496
  end
  inherited cxInternalCRUDImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 37355735
  end
  inherited cxErrorImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 37224768
  end
  object ZTProvincia: TZTable
    Connection = ConnectionModule.ZConnection
    CachedUpdates = True
    TableName = 'provincias'
    Left = 88
    Top = 480
  end
  object DSProvincia: TDataSource
    DataSet = ZTProvincia
    Left = 88
    Top = 528
  end
  object ZTLocalidad: TZTable
    Connection = ConnectionModule.ZConnection
    CachedUpdates = True
    TableName = 'localidad'
    MasterFields = 'oid'
    MasterSource = DSProvincia
    LinkedFields = 'provincia_oid'
    Left = 160
    Top = 480
  end
  object DSLocalidad: TDataSource
    DataSet = ZTLocalidad
    Left = 160
    Top = 528
  end
  object ZTipoMoto: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'nombre'
    CachedUpdates = True
    TableName = 'modelo_moto'
    IndexFieldNames = 'nombre Asc'
    Left = 416
    Top = 416
  end
  object DSTipoMoto: TDataSource
    DataSet = ZTipoMoto
    Left = 416
    Top = 464
  end
  object ZCategoria: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'nombre'
    Filter = 'tipo_categoria_oid = 1'
    Filtered = True
    CachedUpdates = True
    TableName = 'categorias'
    IndexFieldNames = 'nombre Asc'
    Left = 480
    Top = 417
  end
  object DSCategoria: TDataSource
    DataSet = ZCategoria
    Left = 528
    Top = 465
  end
  object ZCategoriaMotocross: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'nombre'
    Filter = 'tipo_categoria_oid = 3'
    Filtered = True
    CachedUpdates = True
    TableName = 'categorias'
    IndexFieldNames = 'nombre Asc'
    Left = 152
    Top = 441
  end
  object DSCategoriaMotocross: TDataSource
    DataSet = ZCategoriaMotocross
    Left = 208
    Top = 441
  end
  object ZCategoriaCuatriciclos: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'nombre'
    Filter = 'tipo_categoria_oid = 2'
    Filtered = True
    CachedUpdates = True
    TableName = 'categorias'
    IndexFieldNames = 'nombre Asc'
    Left = 424
    Top = 513
  end
  object DSCategoriaCuatriciclos: TDataSource
    DataSet = ZCategoriaCuatriciclos
    Left = 528
    Top = 513
  end
  object ZROQHistorico: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      'select c.*'
      'from piloto_historico_evento phe'
      '     inner join categorias c on c.oid = phe.categoria_oid'
      'where evento_oid = 113'
      '      and piloto_oid = :piloto_oid     ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
    Left = 544
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
  end
  object DSHistorico: TDataSource
    DataSet = ZROQHistorico
    Left = 616
    Top = 352
  end
  object ZROQHistoricoRecargoInscripcion: TZReadOnlyQuery
    Connection = ConnectionModule.ZConnectionQueries
    SQL.Strings = (
      'select * from ('
      
        'select e.fecha, CONCAT('#39'REC. '#39', rtte.segundos_recargo, '#39' segs'#39', ' +
        #39' - '#39', e.nombre, '#39' - '#39', tr.nombre, '#39' - '#39', tte.tipo_toma_tiempo) ' +
        'historico'
      'from recargo_toma_tiempo_evento rtte'
      '     inner join tipo_recargo tr on rtte.tipo_recargo = tr.oid'
      
        '     inner join toma_tiempo_evento tte on tte.oid = rtte.toma_ti' +
        'empo_evento_oid'
      '     inner join evento e on e.oid = tte.evento_oid'
      '     inner join campeonato c on c.oid = e.campeonato_oid'
      'where piloto_oid = :piloto_oid'
      '      and c.nombre like '#39'Enduro%'#39
      'union'
      'select e.fecha, CONCAT('#39'INS. '#39', c.nombre, '#39' - '#39', e.nombre, '
      
        '       '#39', Puesto: '#39',  sel_puesto_by_event_oid_and_pilot_oid(e.oi' +
        'd, piloto_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_even' +
        'to_and_tipo_categoria(ipe.tipo_categoria_oid, e.oid, piloto_oid)' +
        '),'
      
        '       '#39', Puntos: '#39',  sel_puntos_by_event_oid_and_pilot_oid(e.oi' +
        'd, piloto_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_even' +
        'to_and_tipo_categoria(ipe.tipo_categoria_oid, e.oid, piloto_oid)' +
        ')       '
      '       )'
      'from inscripcion_piloto_evento ipe'
      '     inner join evento e on e.oid = ipe.evento_oid'
      '     inner join campeonato c on c.oid = e.campeonato_oid'
      'where piloto_oid = :piloto_oid'
      '      and c.nombre like '#39'Enduro%'#39') subquery'
      'order by fecha desc      ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
    Left = 416
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
  end
  object DSHistoricoRecargoInscripcion: TDataSource
    DataSet = ZROQHistoricoRecargoInscripcion
    Left = 592
    Top = 352
  end
  object ZCategoriaExterna: TZTable
    Connection = ConnectionModule.ZConnection
    SortedFields = 'nombre'
    Filter = 'tipo_categoria_oid = 4'
    Filtered = True
    CachedUpdates = True
    TableName = 'categorias'
    IndexFieldNames = 'nombre Asc'
    Left = 424
    Top = 561
  end
  object DSCategoriaExterna: TDataSource
    DataSet = ZCategoriaExterna
    Left = 512
    Top = 561
  end
end
