inherited UserCRUD: TUserCRUD
  inherited filterPanel: TPanel
    TabOrder = 1
    OnResize = filterPanelResize
    inherited btnFilter: TAeroButton
      Top = 127
      ExplicitTop = 127
    end
    inherited filterGB: TGroupBox
      Height = 120
      ExplicitHeight = 120
      object lblUsuario: TcxLabel
        Left = 12
        Top = 82
        Caption = 'Usuario:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
      end
      object txtUsuario: TcxTextEdit
        Left = 61
        Top = 81
        OnFocusChanged = txtNombreFocusChanged
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnExit = txtNombreFocusChanged
        OnKeyUp = txtNombreKeyUp
        Width = 117
      end
      object txtApellido: TcxTextEdit
        Left = 61
        Top = 46
        OnFocusChanged = txtNombreFocusChanged
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnExit = txtNombreFocusChanged
        OnKeyUp = txtNombreKeyUp
        Width = 117
      end
      object lblApellido: TcxLabel
        Left = 11
        Top = 46
        Caption = 'Apellido:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMenuHighlight
        Style.IsFontAssigned = True
      end
    end
  end
  inherited mainPanel: TPanel
    TabOrder = 3
    inherited gridPanel: TPanel
      inherited cxGrid: TcxGrid
        inherited cxGridDBTableView: TcxGridDBTableView
          object cxGridDBTableViewnombre: TcxGridDBColumn
            Caption = 'Nombre'
            DataBinding.FieldName = 'nombre'
          end
          object cxGridDBTableViewapellido: TcxGridDBColumn
            Caption = 'Apellido'
            DataBinding.FieldName = 'apellido'
          end
          object cxGridDBTableViewnro_docu: TcxGridDBColumn
            Caption = 'Nro. Documento'
            DataBinding.FieldName = 'nro_docu'
          end
          object cxGridDBTableViewusername: TcxGridDBColumn
            Caption = 'Usuario'
            DataBinding.FieldName = 'username'
          end
        end
      end
    end
    inherited topPanel: TPanel
      Visible = False
      inherited editorPanel: TPanel
        Visible = False
      end
    end
    inherited bannerPanel: TPanel
      inherited TitleSmoothLabel: TAdvSmoothLabel
        Caption.Text = 'Administraci'#243'n de Usuarios'
      end
    end
  end
  object txtNombre: TcxTextEdit [3]
    Left = 63
    Top = 20
    OnFocusChanged = txtNombreFocusChanged
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    OnExit = txtNombreFocusChanged
    OnKeyUp = txtNombreKeyUp
    Width = 116
  end
  object lblNombre: TcxLabel [4]
    Left = 12
    Top = 21
    Caption = 'Nombre:'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clMenuHighlight
    Style.IsFontAssigned = True
  end
  inherited cxButtonImageList: TcxImageList
    FormatVersion = 1
  end
  inherited queryGrid: TZReadOnlyQuery
    SQL.Strings = (
      'select u.OID, u.nombre, u.apellido, u.nro_docu, cu.username '
      'from usuario u'
      '       join cuenta_usuario cu on u.oid = cu.usuario_oid '
      
        'where (:nombre is null or LENGTH(:nombre) = 0 or MATCH (u.nombre' +
        ') AGAINST (:nombre IN BOOLEAN MODE)) and'
      
        '      (:apellido is null or LENGTH(:apellido) = 0 or MATCH (u.ap' +
        'ellido) AGAINST (:apellido IN BOOLEAN MODE)) and  '
      
        '      (:cuenta is null or LENGTH(:cuenta) = 0 or MATCH (cu.usern' +
        'ame) AGAINST (:cuenta IN BOOLEAN MODE))'
      'LIMIT 100')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cuenta'
        ParamType = ptInput
      end>
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cuenta'
        ParamType = ptInput
      end>
  end
  inherited cxFilterImageList: TcxImageList
    FormatVersion = 1
  end
end
