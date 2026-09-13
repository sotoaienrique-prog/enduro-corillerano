object ConnectionModule: TConnectionModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 897
  Width = 1373
  object ZConnection: TZConnection
    ClientCodepage = 'utf8'
    Catalog = 'enduro'
    Properties.Strings = (
      'codepage=utf8')
    HostName = 'localhost'
    Port = 3306
    User = 'root'
    Password = '15637690'
    Protocol = 'mysqld-5'
    Left = 152
    Top = 8
  end
  object ZLoginQuery: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      
        'select u.oid, u.nombre, u.apellido, u.perfil_oid, pu.nombre as p' +
        'erfil_nombre'
      'from usuario u'
      '       join cuenta_usuario cu on u.oid = cu.usuario_oid'
      '       left join perfil_usuario pu on u.perfil_oid = pu.oid '
      'where cu.username = :username and cu.password = :password')
    Params = <
      item
        DataType = ftString
        Name = 'username'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'password'
        ParamType = ptInput
      end>
    Left = 40
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'username'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'password'
        ParamType = ptInput
      end>
  end
  object ZUniqueValidation: TZReadOnlyQuery
    Connection = ZConnection
    Params = <>
    Left = 120
    Top = 104
  end
  object ZAddUsuario: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO usuario'
      '    (nombre, apellido, nro_docu, perfil_oid)'
      'VALUES'
      '    (:nombre, :apellido, :nro_docu, :perfil_oid)')
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
        Name = 'nro_docu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'perfil_oid'
        ParamType = ptInput
      end>
    Left = 40
    Top = 176
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
        Name = 'nro_docu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'perfil_oid'
        ParamType = ptInput
      end>
  end
  object ZSelLastInsOID: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT LAST_INSERT_ID() as OID;')
    Params = <>
    Left = 296
    Top = 72
  end
  object ZModifyUsuario: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  usuario'
      'SET'
      '  nombre = :nombre,'
      '  apellido = :apellido,'
      '  nro_docu = :nro_docu,'
      '  perfil_oid = :perfil_oid'
      'WHERE'
      '  oid = :oid')
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
        Name = 'nro_docu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'perfil_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 120
    Top = 176
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
        Name = 'nro_docu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'perfil_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetUsuario: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      
        '  u.oid, u.nombre, u.apellido, u.nro_docu, u.perfil_oid, cu.user' +
        'name, cu.password'
      'FROM usuario u'
      '       join cuenta_usuario cu on u.oid = cu.usuario_oid '
      'WHERE u.oid=:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 200
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZDeleteUsuario: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  usuario'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 280
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZAddCuentaUsuario: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO cuenta_usuario'
      '    (username, password, usuario_oid)'
      'VALUES'
      '    (:username, :password, :usuario_oid)')
    Params = <
      item
        DataType = ftString
        Name = 'username'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'password'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usuario_oid'
        ParamType = ptInput
      end>
    Left = 40
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'username'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'password'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usuario_oid'
        ParamType = ptInput
      end>
  end
  object ZModifyCuentaUsuario: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  cuenta_usuario'
      'SET'
      '  username = :username,'
      '  password = :password'
      'WHERE'
      '  usuario_oid = :usuario_oid')
    Params = <
      item
        DataType = ftString
        Name = 'username'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'password'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usuario_oid'
        ParamType = ptInput
      end>
    Left = 152
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'username'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'password'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usuario_oid'
        ParamType = ptInput
      end>
  end
  object ZDeletePiloto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  piloto'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 280
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZAddPiloto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO piloto'
      
        '    (nombre, apellido, nro_docu, fecha_nacimiento, direccion, lo' +
        'calidad_oid, telefono, email, nro_moto, nro_moto_cross, nro_cuat' +
        'riciclo, '
      
        'modelo_moto_oid, tag, responsabilidad_civil, categoria_oid, cate' +
        'goria_motocross_oid, categoria_cuatriciclos_oid, telefono_acompa' +
        'niante, notas, tid, telefono_fijo, aplica_handicup, es_campeon, ' +
        'ranking, ranking_externo, categoria_externa_oid, nro_campeonato_' +
        'externo)'
      'VALUES'
      
        '    (:nombre, :apellido, :nro_docu, :fecha_nacimiento, :direccio' +
        'n, :localidad_oid, :telefono, :email, :nro_moto, :nro_moto_cross' +
        ', :nro_cuatriciclo, '
      
        ':modelo_moto_oid, :tag, :responsabilidad_civil, :categoria_oid, ' +
        ':categoria_motocross_oid, :categoria_cuatriciclos_oid, :telefono' +
        '_acompaniante, :notas, :tid, :telefono_fijo, :aplica_handicup, :' +
        'es_campeon, :ranking, :ranking_externo,  :categoria_externa_oid,' +
        ' :nro_campeonato_externo)'
      '')
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
        Name = 'nro_docu'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha_nacimiento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'direccion'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'localidad_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefono'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nro_moto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_moto_cross'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_cuatriciclo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'modelo_moto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tag'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'responsabilidad_civil'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'categoria_motocross_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'categoria_cuatriciclos_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefono_acompaniante'
        ParamType = ptInput
      end
      item
        DataType = ftWideMemo
        Name = 'notas'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'aplica_handicup'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'es_campeon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ranking'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ranking_externo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'categoria_externa_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_campeonato_externo'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 288
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
        Name = 'nro_docu'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha_nacimiento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'direccion'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'localidad_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefono'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nro_moto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_moto_cross'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_cuatriciclo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'modelo_moto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tag'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'responsabilidad_civil'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'categoria_motocross_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'categoria_cuatriciclos_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefono_acompaniante'
        ParamType = ptInput
      end
      item
        DataType = ftWideMemo
        Name = 'notas'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'aplica_handicup'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'es_campeon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ranking'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ranking_externo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'categoria_externa_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_campeonato_externo'
        ParamType = ptUnknown
      end>
  end
  object ZModifyPiloto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  piloto'
      'SET'
      '  nombre = :nombre,'
      '  apellido = :apellido,'
      '  nro_docu = :nro_docu,'
      '  fecha_nacimiento = :fecha_nacimiento,'
      '  direccion = :direccion,'
      '  localidad_oid = :localidad_oid,'
      '  telefono = :telefono,'
      '  telefono_acompaniante = :telefono_acompaniante,'
      '  email = :email,'
      '  nro_moto = :nro_moto,'
      '  nro_moto_cross = :nro_moto_cross,'
      '  nro_cuatriciclo = :nro_cuatriciclo,'
      '  modelo_moto_oid = :modelo_moto_oid,'
      '  categoria_oid = :categoria_oid,'
      '  categoria_motocross_oid = :categoria_motocross_oid,'
      '  categoria_cuatriciclos_oid = :categoria_cuatriciclos_oid,'
      '  tag = :tag,'
      '  responsabilidad_civil = :responsabilidad_civil,'
      '  notas = :notas,'
      '  tid = :tid,'
      '  telefono_fijo = :telefono_fijo,'
      '  aplica_handicup = :aplica_handicup,'
      '  es_campeon = :es_campeon,'
      '  ranking = :ranking,'
      '  ranking_externo = :ranking_externo,'
      '  categoria_externa_oid = :categoria_externa_oid,'
      '  nro_campeonato_externo = :nro_campeonato_externo'
      'WHERE'
      '  oid = :oid')
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
        Name = 'nro_docu'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha_nacimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'localidad_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'telefono_acompaniante'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_moto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nro_moto_cross'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_cuatriciclo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'modelo_moto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'categoria_motocross_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_cuatriciclos_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tag'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'responsabilidad_civil'
        ParamType = ptInput
      end
      item
        DataType = ftWideMemo
        Name = 'notas'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'aplica_handicup'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'es_campeon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ranking'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ranking_externo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'categoria_externa_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_campeonato_externo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 120
    Top = 288
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
        Name = 'nro_docu'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha_nacimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'localidad_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'telefono_acompaniante'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_moto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nro_moto_cross'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_cuatriciclo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'modelo_moto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'categoria_motocross_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_cuatriciclos_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tag'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'responsabilidad_civil'
        ParamType = ptInput
      end
      item
        DataType = ftWideMemo
        Name = 'notas'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'aplica_handicup'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'es_campeon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ranking'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ranking_externo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'categoria_externa_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_campeonato_externo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetPiloto: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      
        '  p.*, l.provincia_oid, c.nombre as categoria, m.nombre as model' +
        'o_moto,'
      
        '  l.localidad, c_cuatri.nombre as categoria_cuatricilo, c_cross.' +
        'nombre as categoria_motocross'
      'FROM piloto p'
      '     left join localidad l on p.localidad_oid = l.oid'
      '     left join categorias c on p.categoria_oid = c.oid'
      
        '     left join categorias c_cuatri on p.categoria_cuatriciclos_o' +
        'id = c_cuatri.oid'
      
        '     left join categorias c_cross on p.categoria_motocross_oid =' +
        ' c_cross.oid'
      '     left join modelo_moto m on p.modelo_moto_oid = m.oid   '
      'WHERE p.oid=:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 200
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZAddEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO evento'
      
        '    (nombre, fecha, nro_fecha, distancia, localidad_oid, campeon' +
        'ato_oid, tipo_evento_oid, nro_vueltas, ultima_fecha, usa_puntos_' +
        'extra, usa_handicup)'
      'VALUES'
      
        '    (:nombre, :fecha, :nro_fecha, :distancia, :localidad_oid, :c' +
        'ampeonato_oid, :tipo_evento_oid, :nro_vueltas, :ultima_fecha, :u' +
        'sa_puntos_extra, :usa_handicup)')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'nro_fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'distancia'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'localidad_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'campeonato_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'nro_vueltas'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ultima_fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usa_puntos_extra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usa_handicup'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'nro_fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'distancia'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'localidad_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'campeonato_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'nro_vueltas'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ultima_fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usa_puntos_extra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usa_handicup'
        ParamType = ptUnknown
      end>
  end
  object ZModifyEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  evento'
      'SET'
      '  nombre = :nombre,'
      '  fecha = :fecha,'
      '  nro_fecha = :nro_fecha,'
      '  distancia = :distancia,'
      '  localidad_oid = :localidad_oid,'
      '  campeonato_oid = :campeonato_oid, '
      '  tipo_evento_oid =:tipo_evento_oid,'
      '  nro_vueltas =:nro_vueltas,'
      '  ultima_fecha = :ultima_fecha,'
      '  usa_puntos_extra = :usa_puntos_extra,'
      '  usa_handicup =:usa_handicup'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftShortint
        Name = 'nro_fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'distancia'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'localidad_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'campeonato_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'nro_vueltas'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ultima_fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usa_puntos_extra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usa_handicup'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 120
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftShortint
        Name = 'nro_fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'distancia'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'localidad_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'campeonato_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'nro_vueltas'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ultima_fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usa_puntos_extra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usa_handicup'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetEvento: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      '  e.*, l.provincia_oid'
      'FROM evento e'
      '     left join localidad l on e.localidad_oid = l.oid'
      'WHERE e.oid=:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 200
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZDeleteEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  evento'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 280
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetInscripcion: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      ' oid, evento_oid, piloto_oid'
      'FROM inscripcion_piloto_evento'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
  end
  object ZDeleteInscripcion: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  inscripcion_piloto_evento'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 280
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZAddInscripcion: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO inscripcion_piloto_evento'
      
        '    (evento_oid, piloto_oid, es_dia_inscripcion, tipo_categoria_' +
        'oid)'
      'VALUES'
      
        '    (:evento_oid, :piloto_oid, :es_dia_inscripcion, :tipo_catego' +
        'ria_oid)')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'es_dia_inscripcion'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end>
    Left = 24
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'es_dia_inscripcion'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end>
  end
  object ZGetPiolotoByTag: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      '  p.oid'
      'FROM piloto p'
      'WHERE p.tag=:tag')
    Params = <
      item
        DataType = ftString
        Name = 'tag'
        ParamType = ptInput
      end>
    Left = 360
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'tag'
        ParamType = ptInput
      end>
  end
  object ZDeletePuntuacion: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE ppe '
      'FROM'
      '  puntos_piloto_evento ppe'
      'WHERE'
      '  ppe.evento_oid= :evento_oid and'
      '  ppe.categoria_oid = :categoria_oid    ')
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
    Left = 280
    Top = 448
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
  object ZAddPuntuacion: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO puntos_piloto_evento'
      '    (piloto_oid, evento_oid, puntos, puesto, categoria_oid)'
      'VALUES'
      '    (:piloto_oid, :evento_oid, :puntos, :puesto, :categoria_oid)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'puntos'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'puesto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
    Left = 40
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'puntos'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'puesto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
  end
  object ZAddCategoria: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO categorias'
      
        '    (nombre, tipo_categoria_oid, valor_seguro, valor_seguro_text' +
        'o, edad_minima, edad_maxima, calc_hand_edad, calc_hand_moto, val' +
        'or_organizador, valor_cordillerano, utiliza_acompaniante)'
      'VALUES'
      
        '    (:nombre, :tipo_categoria_oid, :valor_seguro, :valor_seguro_' +
        'texto, :edad_minima, :edad_maxima, :calc_hand_edad, :calc_hand_m' +
        'oto, :valor_organizador, :valor_cordillerano, :utiliza_acompania' +
        'nte)')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor_seguro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'valor_seguro_texto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_minima'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_maxima'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'calc_hand_edad'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'calc_hand_moto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valor_organizador'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valor_cordillerano'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'utiliza_acompaniante'
        ParamType = ptUnknown
      end>
    Left = 416
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor_seguro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'valor_seguro_texto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_minima'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_maxima'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'calc_hand_edad'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'calc_hand_moto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valor_organizador'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valor_cordillerano'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'utiliza_acompaniante'
        ParamType = ptUnknown
      end>
  end
  object ZModifyCategoria: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  categorias'
      'SET'
      '  nombre = :nombre,'
      '  tipo_categoria_oid = :tipo_categoria_oid,'
      '  valor_seguro = :valor_seguro,'
      '  valor_seguro_texto = :valor_seguro_texto,'
      '  edad_minima = :edad_minima, '
      '  edad_maxima = :edad_maxima,'
      '  calc_hand_edad = :calc_hand_edad,'
      '  calc_hand_moto = :calc_hand_moto,'
      '  valor_organizador = :valor_organizador,'
      '  valor_cordillerano = :valor_cordillerano,'
      '  utiliza_acompaniante = :utiliza_acompaniante'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'valor_seguro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'valor_seguro_texto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_minima'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_maxima'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'calc_hand_edad'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'calc_hand_moto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valor_organizador'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valor_cordillerano'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'utiliza_acompaniante'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 504
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'valor_seguro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'valor_seguro_texto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_minima'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_maxima'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'calc_hand_edad'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'calc_hand_moto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valor_organizador'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valor_cordillerano'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'utiliza_acompaniante'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetCategoria: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      
        '  cat.oid, cat.nombre, cat.tipo_categoria_oid, nc.inicio, nc.fin' +
        ', cat.valor_seguro, cat.valor_seguro_texto, cat.edad_maxima, '
      
        'cat.edad_minima, cat.calc_hand_edad, cat.calc_hand_moto, cat.val' +
        'or_organizador, cat.valor_cordillerano, cat.utiliza_acompaniante'
      'FROM categorias cat'
      '     join numeracion_categoria nc on cat.oid = nc.categoria_oid'
      'WHERE cat.oid =:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 608
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZDeleteCategoria: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  categorias'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 704
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZAddNumeracion: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO numeracion_categoria'
      '    (categoria_oid, inicio, fin)'
      'VALUES'
      '    (:categoria_oid, :inicio, :fin)')
    Params = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fin'
        ParamType = ptUnknown
      end>
    Left = 416
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fin'
        ParamType = ptUnknown
      end>
  end
  object ZModifyNumeracion: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  numeracion_categoria'
      'SET'
      '  inicio = :inicio,'
      '  fin = :fin'
      'WHERE'
      '  categoria_oid = :categoria_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'inicio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'fin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
    Left = 512
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'inicio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'fin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
  end
  object ZAddHandicup: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO handicup'
      
        '    (tipo_handicup, edad_base, segundos_anio, categoria_oid, mod' +
        'elo_moto_oid)'
      'VALUES'
      
        '    (:tipo_handicup, :edad_base, :segundos_anio, :categoria_oid,' +
        ' :modelo_moto_oid)')
    Params = <
      item
        DataType = ftString
        Name = 'tipo_handicup'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_base'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'segundos_anio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'modelo_moto_oid'
        ParamType = ptInput
      end>
    Left = 456
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'tipo_handicup'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_base'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'segundos_anio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'modelo_moto_oid'
        ParamType = ptInput
      end>
  end
  object ZModifyHandicup: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  handicup'
      'SET'
      '  tipo_handicup = :tipo_handicup,'
      '  edad_base = :edad_base,'
      '  segundos_anio = :segundos_anio,'
      '  categoria_oid = :categoria_oid,'
      '  modelo_moto_oid = :modelo_moto_oid'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftString
        Name = 'tipo_handicup'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_base'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'segundos_anio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'modelo_moto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 544
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'tipo_handicup'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'edad_base'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'segundos_anio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'modelo_moto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZDeleteHandicup: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  handicup'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 712
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetHandicup: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      
        '  oid, tipo_handicup, edad_base, segundos_anio, categoria_oid, m' +
        'odelo_moto_oid'
      'FROM handicup'
      'WHERE oid =:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 624
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZAddMoto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO modelo_moto'
      '    (nombre, puntos_extra)'
      'VALUES'
      '    (:nombre, :puntos_extra)')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'puntos_extra'
        ParamType = ptInput
      end>
    Left = 456
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'puntos_extra'
        ParamType = ptInput
      end>
  end
  object ZModifyMoto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  modelo_moto'
      'SET'
      '  nombre = :nombre,'
      '  puntos_extra = :puntos_extra'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'puntos_extra'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 544
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'puntos_extra'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetMoto: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      '  mm.oid, mm.nombre, mm.puntos_extra'
      'FROM modelo_moto mm'
      'WHERE mm.oid =:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 624
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZDeleteMoto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  modelo_moto'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 712
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZAddParadaPiloto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO paradas_piloto'
      '    (piloto_oid, evento_oid, tipo_categoria_oid)'
      'VALUES'
      '    (:piloto_oid, :evento_oid, :tipo_categoria_oid)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo_categoria_oid'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo_categoria_oid'
        ParamType = ptUnknown
      end>
  end
  object ZGetPilotoByNumMoto: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      
        'SELECT sel_piloto_oid_by_evento_and_tipo_categoria_and_nro_moto(' +
        ':tipo_categoria_oid, :evento_oid,  :nro_moto) piloto_oid FROM pi' +
        'loto LIMIT 1')
    Params = <
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nro_moto'
        ParamType = ptInput
      end>
    Left = 560
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nro_moto'
        ParamType = ptInput
      end>
  end
  object ZGetInscripcionByPilotoAndEvento: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      ' oid, tipo_categoria_oid'
      'FROM inscripcion_piloto_evento'
      'WHERE'
      '  evento_oid = :evento_oid AND piloto_oid = :piloto_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end>
    Left = 120
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end>
  end
  object ZGetParadaPiloto: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      '  oid, piloto_oid, evento_oid, fecha_ingreso'
      'FROM paradas_piloto'
      'WHERE piloto_oid= :piloto_oid '
      '          AND evento_oid = :evento_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 672
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object ZDeleteParadaPilotoEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  paradas_piloto'
      'WHERE'
      '  evento_oid = :evento_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 456
    Top = 488
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object ZAddCampeonato: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO campeonato'
      '    (nombre)'
      'VALUES'
      '    (:nombre)')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end>
    Left = 456
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end>
  end
  object ZModifyCampeonato: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  campeonato'
      'SET'
      '  nombre = :nombre'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 544
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetCampeonato: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      ' oid, nombre'
      'FROM campeonato'
      'WHERE oid =:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 624
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZDeleteCampeonato: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  campeonato'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 712
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZAddTomaTiempo: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO toma_tiempos'
      '    (piloto_oid, toma_tiempo_evento_oid, nro_vuelta)'
      'VALUES'
      '    (:piloto_oid, :toma_tiempo_evento_oid, :nro_vuelta)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
    Left = 424
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
  end
  object ZUpdateTomaTiempo: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  toma_tiempos'
      'SET'
      '  piloto_oid = :piloto_oid,'
      '  nro_vuelta = :nro_vuelta,'
      '  tiempo_pasada = tiempo_pasada'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'nro_vuelta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
    Left = 528
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'nro_vuelta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
  end
  object ZAddTomaTiempoEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO toma_tiempo_evento'
      '    (nombre, evento_oid, tipo_toma_tiempo)'
      'VALUES'
      '    (:nombre, :evento_oid, :tipo_toma_tiempo)')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo_toma_tiempo'
        ParamType = ptUnknown
      end>
    Left = 400
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo_toma_tiempo'
        ParamType = ptUnknown
      end>
  end
  object ZUpdateEstadoTomaTiempo: TZQuery
    Connection = ZConnectionUpdate
    SQL.Strings = (
      'UPDATE'
      '  toma_tiempos'
      'SET'
      '  is_deleted = :is_deleted'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftSmallint
        Name = 'is_deleted'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
    Left = 680
    Top = 8
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'is_deleted'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
  end
  object ZDeleteNumCategoria: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  numeracion_categoria'
      'WHERE'
      '  categoria_oid= :categoria_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
    Left = 800
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end>
  end
  object GetNroVuelta: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT count(distinct tt.nro_vuelta) count'
      'FROM toma_tiempos tt'
      'WHERE tt.piloto_oid = :piloto_oid '
      'AND tt.toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND tt.is_deleted = 0')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
    Left = 840
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
  end
  object ZGetVueltasPorCategoria: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select enc.*, cat.nombre nombre_categoria'
      'from evento_num_categoria enc'
      '     join categorias cat on enc.categoria_oid = cat.oid'
      'where enc.evento_oid = :evento_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 176
    Top = 512
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object ZDeleteVueltasPorCategoria: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  evento_num_categoria'
      'WHERE'
      '  evento_oid= :evento_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 352
    Top = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object ZAddVueltasPorCategoria: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO evento_num_categoria'
      '    (categoria_oid, nro_vueltas, evento_oid)'
      'VALUES'
      '    (:categoria_oid, :nro_vueltas, :evento_oid)')
    Params = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vueltas'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 40
    Top = 512
    ParamData = <
      item
        DataType = ftInteger
        Name = 'categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vueltas'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object ZAddTomaTiempoWithTiempo: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO toma_tiempos'
      
        '    (piloto_oid, toma_tiempo_evento_oid, tiempo_pasada, nro_vuel' +
        'ta, toma_tiempo_importada)'
      'VALUES'
      
        '    (:piloto_oid, :toma_tiempo_evento_oid, :tiempo_pasada, :nro_' +
        'vuelta, :toma_tiempo_importada)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_importada'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_importada'
        ParamType = ptUnknown
      end>
  end
  object GetNroCuenta2: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT count(distinct tt.nro_vuelta) count'
      'FROM toma_tiempos tt'
      'WHERE tt.piloto_oid = :piloto_oid '
      'AND tt.toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND tt.is_deleted = 0')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
    Left = 824
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
  end
  object ZCategoriaOIDByTipoCatAndEvento: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      
        'select sel_categoria_oid_by_evento_and_tipo_categoria(:tipo_cate' +
        'goria_oid, :evento_oid, :piloto_oid) categoria_oid'
      'from tipo_categoria'
      'limit 1')
    Params = <
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end>
    Left = 616
    Top = 488
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end>
  end
  object ZAddRecargoTomaTiempoEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO recargo_toma_tiempo_evento'
      
        '    (toma_tiempo_evento_oid, piloto_oid, tipo_categoria_oid, seg' +
        'undos_recargo, tipo_recargo)'
      'VALUES'
      
        '    (:toma_tiempo_evento_oid, :piloto_oid, :tipo_categoria_oid, ' +
        ':segundos_recargo, :tipo_recargo)')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'segundos_recargo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_recargo'
        ParamType = ptInput
      end>
    Left = 800
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'segundos_recargo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo_recargo'
        ParamType = ptInput
      end>
  end
  object ZDeleteRecargoTomaTiempoEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  recargo_toma_tiempo_evento'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 800
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZUpdateNroVueltaAddPasada: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE toma_tiempos'
      'SET nro_vuelta = nro_vuelta + 1'
      ''
      'WHERE piloto_oid = :piloto_oid '
      'AND toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND is_deleted = 0'
      'AND tiempo_pasada > :tiempo_pasada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tiempo_pasada'
        ParamType = ptUnknown
      end>
    Left = 1000
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tiempo_pasada'
        ParamType = ptUnknown
      end>
  end
  object ZGetTomaTiempo: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      
        '  oid, piloto_oid, tiempo_pasada, is_deleted, toma_tiempo_evento' +
        '_oid, nro_vuelta, evento_oid'
      'FROM toma_tiempos'
      'WHERE oid =:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 1000
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZUpdateNroVueltaDisalbePasada: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE toma_tiempos'
      'SET nro_vuelta = nro_vuelta - 1,'
      '       tiempo_pasada = tiempo_pasada'
      ''
      'WHERE piloto_oid = :piloto_oid '
      'AND toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND nro_vuelta > :nro_vuelta'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
    Left = 1000
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
  end
  object ZUpdateNroVueltaEnablePasada: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE toma_tiempos'
      'SET nro_vuelta = nro_vuelta + 1,'
      '       tiempo_pasada = tiempo_pasada'
      ''
      'WHERE piloto_oid = :piloto_oid '
      'AND toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND nro_vuelta >= :nro_vuelta'
      'AND oid <> :oid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
    Left = 1000
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
  end
  object ZAddLecturaTagsAntena: TZQuery
    Connection = ZConnectionAntena
    SQL.Strings = (
      'INSERT INTO lectura_tags_antena'
      '    (tagid, timestampux)'
      'VALUES'
      '    (:tagid, :timestampux)')
    Params = <
      item
        DataType = ftString
        Name = 'tagid'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'timestampux'
        ParamType = ptInput
      end>
    Left = 1000
    Top = 488
    ParamData = <
      item
        DataType = ftString
        Name = 'tagid'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'timestampux'
        ParamType = ptInput
      end>
  end
  object ZGetPilotoByTagID: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      '  p.oid'
      'FROM piloto p'
      'WHERE p.tid=:tid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tid'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tid'
        ParamType = ptUnknown
      end>
  end
  object ZGetTomaTiempoEvento: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT *'
      'FROM toma_tiempo_evento'
      'WHERE oid=:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 968
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZAddTomaTiempoWithTagID: TZQuery
    Connection = ZConnectionAntena
    SQL.Strings = (
      'INSERT INTO toma_tiempos'
      
        '    (piloto_oid, toma_tiempo_evento_oid, tiempo_pasada, nro_vuel' +
        'ta, lectura_tag_antena_oid)'
      'VALUES'
      
        '    (:piloto_oid, :toma_tiempo_evento_oid, :tiempo_pasada, :nro_' +
        'vuelta, :lectura_tag_antena_oid)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'lectura_tag_antena_oid'
        ParamType = ptInput
      end>
    Left = 688
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'lectura_tag_antena_oid'
        ParamType = ptInput
      end>
  end
  object ZROQNroVueltaByCategoria: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select COALESCE(enc.nro_vueltas, e.nro_vueltas) AS nro_vueltas'
      'from evento e'
      
        '     LEFT JOIN evento_num_categoria enc on enc.evento_oid = e.oi' +
        'd'
      'where e.oid = :evento_oid '
      
        '      and (enc.categoria_oid is null or enc.categoria_oid =  :ca' +
        'tegoria_oid)')
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
    Left = 920
    Top = 16
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
  object ZGetTipoCategoriaByEventoAndLargada: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select cat.tipo_categoria_oid'
      'from toma_tiempos tt'
      
        '     join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = ' +
        'tte.oid'
      '     join piloto p on tt.piloto_oid = p.oid, categorias cat '
      
        'where sel_categoria_oid_by_evento_and_tipo_categoria((select min' +
        '(ipe.tipo_categoria_oid)'
      
        '                                               from inscripcion_' +
        'piloto_evento ipe'
      
        '                                               where ipe.evento_' +
        'oid = tte.evento_oid '
      
        '                                               and ipe.piloto_oi' +
        'd = p.oid), tte.evento_oid, p.oid) = cat.oid'
      'and tte.oid = :toma_tiempo_evento_oid'
      'and tt.is_deleted = 0'
      'group by cat.tipo_categoria_oid'
      'order by count(tt.oid) desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end>
    Left = 1160
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end>
  end
  object ZGetTomaTiempoByPilotoNroVuelta: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select *'
      'from toma_tiempos'
      'where toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      '      and piloto_oid = :piloto_oid and nro_vuelta = :nro_vuelta')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end>
    Left = 968
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end>
  end
  object GetNroVueltaReconocimiento: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT count(tt.oid) count'
      'FROM toma_tiempos_reconocimiento tt'
      'WHERE tt.piloto_oid = :piloto_oid '
      'AND tt.toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND tt.is_deleted = 0')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
    Left = 840
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
  end
  object ZAddReconocimientoWithTagID: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO toma_tiempos_reconocimiento'
      
        '    (piloto_oid, toma_tiempo_evento_oid, tiempo_pasada, nro_vuel' +
        'ta, lectura_tag_antena_oid)'
      'VALUES'
      
        '    (:piloto_oid, :toma_tiempo_evento_oid, :tiempo_pasada, :nro_' +
        'vuelta, :lectura_tag_antena_oid)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'lectura_tag_antena_oid'
        ParamType = ptInput
      end>
    Left = 1072
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'lectura_tag_antena_oid'
        ParamType = ptInput
      end>
  end
  object ZConnectionQueries: TZConnection
    ClientCodepage = 'utf8'
    Catalog = 'enduro'
    Properties.Strings = (
      'codepage=utf8')
    HostName = 'localhost'
    Port = 0
    Database = 'enduro'
    User = 'root'
    Password = '15637690'
    Protocol = 'mysqld-5'
    Left = 64
    Top = 8
  end
  object ZAddReconocimientoWithTiempo: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO toma_tiempos_reconocimiento'
      
        '    (piloto_oid, toma_tiempo_evento_oid, tiempo_pasada, nro_vuel' +
        'ta)'
      'VALUES'
      
        '    (:piloto_oid, :toma_tiempo_evento_oid, :tiempo_pasada, :nro_' +
        'vuelta)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end>
    Left = 1200
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end>
  end
  object ZUpdateEstadoReconocimiento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  toma_tiempos_reconocimiento'
      'SET'
      '  is_deleted = :is_deleted'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftSmallint
        Name = 'is_deleted'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
    Left = 1160
    Top = 440
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'is_deleted'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
  end
  object ZGetReconocimiento: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      
        '  oid, piloto_oid, tiempo_pasada, is_deleted, toma_tiempo_evento' +
        '_oid, nro_vuelta'
      'FROM toma_tiempos_reconocimiento'
      'WHERE oid =:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 1160
    Top = 488
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZUpdateNroVueltaEnablePasadaRec: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE toma_tiempos_reconocimiento'
      'SET nro_vuelta = nro_vuelta + 1'
      ''
      'WHERE piloto_oid = :piloto_oid '
      'AND toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND nro_vuelta >= :nro_vuelta'
      'AND oid <> :oid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
    Left = 1200
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end>
  end
  object ZUpdateNroVueltaDisalbePasadaRec: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE toma_tiempos_reconocimiento'
      'SET nro_vuelta = nro_vuelta - 1'
      ''
      'WHERE piloto_oid = :piloto_oid '
      'AND toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND nro_vuelta > :nro_vuelta'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
    Left = 1200
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
  end
  object ZGetReconocimientoByPilotoNroVuelta: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select *'
      'from toma_tiempos_reconocimiento'
      'where toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      '      and piloto_oid = :piloto_oid and nro_vuelta = :nro_vuelta')
    Params = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end>
    Left = 1200
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nro_vuelta'
        ParamType = ptInput
      end>
  end
  object ZDeleteTomaTiempoEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  toma_tiempo_evento'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 1208
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZUpdateTomaTiempoEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  toma_tiempo_evento'
      'SET'
      '  nombre = :nombre,'
      '  estado_toma_tiempo = :estado_toma_tiempo'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'estado_toma_tiempo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 528
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'estado_toma_tiempo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZUpdateTagTextTTEvento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  toma_tiempo_evento'
      'SET'
      '  tag_text = :tag_text'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tag_text'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 624
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tag_text'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetTipoCategoriaByEventoAndOrdenLargada: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select distinct c.tipo_categoria_oid'
      'from grilla_de_partida_categorias gpc'
      '     inner join categorias c on gpc.categoria_oid = c.oid'
      'where gpc.evento_oid = :evento_oid'
      '      and orden_de_largada = :orden_largada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orden_largada'
        ParamType = ptUnknown
      end>
    Left = 1160
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orden_largada'
        ParamType = ptUnknown
      end>
  end
  object GetEventoByDate: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select e.oid as evento_oid, e.campeonato_oid'
      'from evento e'
      
        'where e.fecha between DATE_SUB(NOW(), INTERVAL 10 DAY) and DATE_' +
        'ADD(NOW(), INTERVAL 10 DAY)')
    Params = <>
    Left = 776
    Top = 176
  end
  object ZAddContacto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO contacto'
      
        '    (oid, nombre, apellido, direccion, email, telefono_fijo, tel' +
        'efono_celular, localidad_oid, notas)'
      'VALUES'
      
        '    (:oid, :nombre, :apellido, :direccion, :email, :telefono_fij' +
        'o, :telefono_celular, :localidad_oid, :notas)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end
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
        Name = 'direccion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'telefono_celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'localidad_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'notas'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 592
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end
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
        Name = 'direccion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'telefono_celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'localidad_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'notas'
        ParamType = ptUnknown
      end>
  end
  object ZModifyContacto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  contacto'
      'SET'
      '  nombre = :nombre,'
      '  apellido = :apellido,'
      '  direccion = :direccion,'
      '  email = :email,'
      '  telefono_fijo = :telefono_fijo,'
      '  telefono_celular = :telefono_celular,'
      '  localidad_oid = :localidad_oid,'
      '  notas= :notas'
      'WHERE'
      '  oid = :oid')
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
        DataType = ftUnknown
        Name = 'direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'telefono_celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'localidad_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'notas'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 120
    Top = 592
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
        DataType = ftUnknown
        Name = 'direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'telefono_celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'localidad_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'notas'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetContacto: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      '  p.*, l.provincia_oid, l.localidad'
      'FROM contacto p'
      '     left join localidad l on p.localidad_oid = l.oid'
      'WHERE p.oid=:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 200
    Top = 592
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZDeleteContacto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  contacto'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 280
    Top = 592
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object zGetProvinciaByName: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select *'
      'from provincias'
      'where provincia= :provincia')
    Params = <
      item
        DataType = ftUnknown
        Name = 'provincia'
        ParamType = ptUnknown
      end>
    Left = 408
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'provincia'
        ParamType = ptUnknown
      end>
  end
  object ZGetLocalidadByProvinciaAndName: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select *'
      'from localidad l'
      '     where l.provincia_oid = :provincia_oid'
      '           and l.localidad = :localidad')
    Params = <
      item
        DataType = ftUnknown
        Name = 'provincia_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'localidad'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'provincia_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'localidad'
        ParamType = ptUnknown
      end>
  end
  object ZCategoriaByName: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select oid'
      'from categorias'
      'where nombre = :nombre')
    Params = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end>
    Left = 544
    Top = 552
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end>
  end
  object ZGetPdCByEvento: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select *'
      'from evento_punto_de_control'
      'where evento_oid = :evento_oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
    Left = 704
    Top = 576
    ParamData = <
      item
        DataType = ftInteger
        Name = 'evento_oid'
        ParamType = ptInput
      end>
  end
  object ZGetPuntosByPosicion: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select distinct p.punto'
      'from puntuacion p'
      'where p.puesto = :puesto')
    Params = <
      item
        DataType = ftString
        Name = 'puesto'
        ParamType = ptInput
      end>
    Left = 848
    Top = 584
    ParamData = <
      item
        DataType = ftString
        Name = 'puesto'
        ParamType = ptInput
      end>
  end
  object ZGetNroCuentaNow: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT count(distinct tt.nro_vuelta) count'
      'FROM toma_tiempos tt'
      'WHERE tt.piloto_oid = :piloto_oid '
      'AND tt.toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND tt.is_deleted = 0'
      'AND tt.tiempo_pasada <= CURRENT_TIMESTAMP(6)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
    Left = 1216
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
  end
  object GetNroCuenta: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT count(distinct tt.nro_vuelta) count'
      'FROM toma_tiempos tt'
      'WHERE tt.piloto_oid = :piloto_oid '
      'AND tt.toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND tt.tiempo_pasada < :tiempo_pasada'
      'AND tt.is_deleted = 0')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end>
    Left = 880
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end>
  end
  object ZGetNroCuentaReconoNow: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT count(distinct tt.nro_vuelta) count'
      'FROM toma_tiempos_reconocimiento tt'
      'WHERE tt.piloto_oid = :piloto_oid '
      'AND tt.toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND tt.is_deleted = 0'
      'AND tt.tiempo_pasada <= CURRENT_TIMESTAMP(6)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
    Left = 1240
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end>
  end
  object ZAddReconocimiento: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO toma_tiempos_reconocimiento'
      '    (piloto_oid, toma_tiempo_evento_oid, nro_vuelta)'
      'VALUES'
      '    (:piloto_oid, :toma_tiempo_evento_oid, :nro_vuelta)')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
    Left = 1240
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
  end
  object ZGetTipoCategoriaByEventoReconocimiento: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select cat.tipo_categoria_oid'
      'from toma_tiempos_reconocimiento tt'
      
        '     join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = ' +
        'tte.oid'
      '     join piloto p on tt.piloto_oid = p.oid, categorias cat '
      
        'where sel_categoria_oid_by_evento_and_tipo_categoria((select min' +
        '(ipe.tipo_categoria_oid)'
      
        '                                               from inscripcion_' +
        'piloto_evento ipe'
      
        '                                               where ipe.evento_' +
        'oid = tte.evento_oid '
      
        '                                               and ipe.piloto_oi' +
        'd = p.oid), tte.evento_oid, p.oid) = cat.oid'
      'and tte.oid = :toma_tiempo_evento_oid'
      'and tt.is_deleted = 0'
      'group by cat.tipo_categoria_oid'
      'order by count(tt.oid) desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end>
    Left = 1144
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end>
  end
  object ZGetCantPilotosByNumMoto: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      
        'SELECT sel_cantidad_piloto_by_evento_and_tipo_categoria_and_nro_' +
        'moto(:tipo_categoria_oid, :evento_oid,  :nro_moto) cantidad_pilo' +
        'tos FROM piloto LIMIT 1')
    Params = <
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nro_moto'
        ParamType = ptInput
      end>
    Left = 624
    Top = 548
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tipo_categoria_oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nro_moto'
        ParamType = ptInput
      end>
  end
  object ZGetVueltasReconoByTime: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT count(distinct tt.nro_vuelta) count'
      'FROM toma_tiempos_reconocimiento tt'
      'WHERE tt.piloto_oid = :piloto_oid '
      'AND tt.toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND tt.tiempo_pasada < :tiempo_pasada'
      'AND tt.is_deleted = 0')
    Params = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end>
    Left = 200
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piloto_oid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'tiempo_pasada'
        ParamType = ptInput
      end>
  end
  object ZUpdateNroVueltaAddPasadaRecono: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE toma_tiempos_reconocimiento'
      'SET nro_vuelta = nro_vuelta + 1'
      ''
      'WHERE piloto_oid = :piloto_oid '
      'AND toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'AND is_deleted = 0'
      'AND tiempo_pasada > :tiempo_pasada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tiempo_pasada'
        ParamType = ptUnknown
      end>
    Left = 624
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tiempo_pasada'
        ParamType = ptUnknown
      end>
  end
  object ZGetLocalidadProinciaByLocalidadOID: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      
        'select CONCAT(l.localidad, '#39', '#39',prov.provincia) localidad_provin' +
        'cia'
      'from localidad l'
      '     left join provincias prov on prov.oid = l.provincia_oid'
      'where l.oid = :localidad_oid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'localidad_oid'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 632
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'localidad_oid'
        ParamType = ptUnknown
      end>
  end
  object ZAddNavegante: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO navegante'
      
        '    (oid, nombre, apellido, email, telefono_fijo, telefono_celul' +
        'ar, piloto_oid)'
      'VALUES'
      
        '    (:oid, :nombre, :apellido, :email, :telefono_fijo, :telefono' +
        '_celular, :piloto_oid)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end
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
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'telefono_celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 672
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptUnknown
      end
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
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'telefono_celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
  end
  object ZModifyNavegante: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  navegante'
      'SET'
      '  nombre = :nombre,'
      '  apellido = :apellido,'
      '  email = :email,'
      '  telefono_fijo = :telefono_fijo,'
      '  telefono_celular = :telefono_celular,'
      '  piloto_oid = :piloto_oid'
      'WHERE'
      '  oid = :oid')
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
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'telefono_celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 120
    Top = 672
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
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telefono_fijo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'telefono_celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetNavegante: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      
        '  oid, nombre, apellido, email, telefono_fijo, telefono_celular,' +
        ' piloto_oid'
      'FROM navegante'
      'WHERE oid=:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 200
    Top = 672
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetNaveganteByPiloto: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      '  oid'
      'FROM navegante'
      'WHERE piloto_oid=:piloto_oid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
    Left = 264
    Top = 672
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
  end
  object ZAddPilotoImportado: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO piloto_importado'
      '    (nombre_apellido, categoria, numero, tiempo_inicial)'
      'VALUES'
      '    (:nombre_apellido, :categoria, :numero, :tiempo_inicial)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nombre_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'categoria'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tiempo_inicial'
        ParamType = ptUnknown
      end>
    Left = 416
    Top = 695
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'categoria'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tiempo_inicial'
        ParamType = ptUnknown
      end>
  end
  object ZModifyPilotoImportado: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  piloto_importado'
      'SET'
      '  nombre_apellido = :nombre_apellido,'
      '  categoria = :categoria,'
      '  numero = :numero'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nombre_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'categoria'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 496
    Top = 695
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'categoria'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZDeletePilotosImportados: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  piloto_importado')
    Params = <>
    Left = 576
    Top = 695
  end
  object ZAddTTAE: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO toma_tiempo_abastecimiento_evento'
      '    (segundos, nombre, fecha)'
      'VALUES'
      '    (:segundos, :nombre, CURRENT_DATE)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'segundos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 751
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'segundos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end>
  end
  object ZGetPilotoImportadoByNumero: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT oid piloto_oid '
      'FROM piloto_importado '
      'where numero = :numero')
    Params = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    Left = 480
    Top = 752
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
  end
  object ZAddTomaTiempoAbastPiloto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO toma_tiempo_abastecimiento'
      '    (piloto_importado_oid, ttae_pod, nro_vuelta)'
      'VALUES'
      '    (:piloto_importado_oid, :ttae_pod, :nro_vuelta)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_importado_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ttae_pod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
    Left = 480
    Top = 804
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_importado_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ttae_pod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
  end
  object ZGetPilotoImportado: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT *'
      'FROM piloto_importado'
      'WHERE oid=:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 672
    Top = 696
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetNroVueltaAbastecimiento: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select COUNT(oid) count'
      'from toma_tiempo_abastecimiento tta'
      'where tta.ttae_pod = :ttae_oid'
      '      and tta.piloto_importado_oid = :piloto_importado_oid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ttae_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_importado_oid'
        ParamType = ptUnknown
      end>
    Left = 632
    Top = 800
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ttae_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_importado_oid'
        ParamType = ptUnknown
      end>
  end
  object ZDeleteTomaTiempoImportada: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  toma_tiempos'
      'WHERE'
      '  toma_tiempo_evento_oid = :toma_tiempo_evento_oid'
      'and toma_tiempo_importada = 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 783
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_evento_oid'
        ParamType = ptUnknown
      end>
  end
  object ZAddTomaTiempoAbastPilotoCT: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO toma_tiempo_abastecimiento'
      '    (piloto_importado_oid, ttae_pod, nro_vuelta, tiempo_pasada)'
      'VALUES'
      
        '    (:piloto_importado_oid, :ttae_pod, :nro_vuelta, :tiempo_pasa' +
        'da)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'piloto_importado_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ttae_pod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tiempo_pasada'
        ParamType = ptUnknown
      end>
    Left = 480
    Top = 852
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'piloto_importado_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ttae_pod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tiempo_pasada'
        ParamType = ptUnknown
      end>
  end
  object ZGetLapTimeAbast: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      
        'select LEFT(TIME_FORMAT(TIMEDIFF((select CAST(MIN(tt.tiempo_pasa' +
        'da) AS TIME) from toma_tiempo_abastecimiento tt where tt.ttae_po' +
        'd = :toma_tiempo_abast and tt.piloto_importado_oid = :piloto_oid' +
        ' and tt.nro_vuelta = :nro_vuelta), '
      
        '(select CAST(MIN(tt2.tiempo_pasada) AS TIME) from toma_tiempo_ab' +
        'astecimiento tt2 where tt2.ttae_pod = :toma_tiempo_abast and tt2' +
        '.piloto_importado_oid = :piloto_oid and tt2.nro_vuelta = :nro_vu' +
        'elta - 1)),'#39'%H:%i:%s.%f'#39'), 12) as tiempo '
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_abast'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
    Left = 776
    Top = 800
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'toma_tiempo_abast'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_vuelta'
        ParamType = ptUnknown
      end>
  end
  object ZAddPuntos: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'INSERT INTO puntuacion'
      '    (puesto, punto, punto_extra)'
      'VALUES'
      '    (:puesto, :punto, :punto_extra)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'puesto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'punto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'punto_extra'
        ParamType = ptUnknown
      end>
    Left = 680
    Top = 656
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'puesto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'punto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'punto_extra'
        ParamType = ptUnknown
      end>
  end
  object ZModifyPuntos: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'UPDATE'
      '  puntuacion'
      'SET'
      '  puesto = :puesto,'
      '  punto = :punto,'
      '  punto_extra = :punto_extra'
      'WHERE'
      '  oid = :oid;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'puesto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'punto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'punto_extra'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 760
    Top = 656
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'puesto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'punto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'punto_extra'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetPuntos: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      '  oid, puesto, punto, punto_extra'
      'FROM puntuacion'
      'WHERE oid =:oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 840
    Top = 656
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZDeletePuntos: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'DELETE FROM'
      '  puntuacion'
      'WHERE'
      '  oid = :oid')
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
    Left = 904
    Top = 656
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
      end>
  end
  object ZGetModeloMotoByName: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select oid'
      'from modelo_moto')
    Params = <>
    Left = 64
    Top = 752
  end
  object ZGetPiolotoByDNI: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'SELECT'
      '  p.oid'
      'FROM piloto p'
      'WHERE REPLACE(p.nro_docu, '#39'.'#39', '#39#39') = :nro_docu')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nro_docu'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nro_docu'
        ParamType = ptUnknown
      end>
  end
  object ZSQLMonitor: TZSQLMonitor
    Active = True
    AutoSave = True
    FileName = 'sql_log.txt'
    MaxTraceCount = 100
    Left = 232
  end
  object ZConnectionUpdate: TZConnection
    ClientCodepage = 'utf8'
    Catalog = 'enduro'
    Properties.Strings = (
      'codepage=utf8')
    HostName = 'localhost'
    Port = 3306
    Database = 'enduro'
    User = 'root'
    Password = '15637690'
    Protocol = 'mysqld-5'
    Left = 80
    Top = 56
  end
  object ZConnectionAntena: TZConnection
    ClientCodepage = 'utf8'
    Catalog = 'enduro'
    Properties.Strings = (
      'codepage=utf8')
    HostName = 'localhost'
    Port = 3306
    Database = 'enduro'
    User = 'root'
    Password = '15637690'
    Protocol = 'mysqld-5'
    Left = 168
    Top = 56
  end
  object ZGetInscripcionEnCampeonato: TZReadOnlyQuery
    Connection = ZConnection
    SQL.Strings = (
      'select * '
      'from inscripcion_piloto_evento ipe'
      '     inner join evento e on e.oid = ipe.evento_oid'
      'where e.campeonato_oid = :campeonato_oid'
      '      and ipe.piloto_oid = :piloto_oid;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'campeonato_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
    Left = 144
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'campeonato_oid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'piloto_oid'
        ParamType = ptUnknown
      end>
  end
  object ZSelLastInsAntenaOID: TZReadOnlyQuery
    Connection = ZConnectionAntena
    SQL.Strings = (
      'SELECT LAST_INSERT_ID() as OID;')
    Params = <>
    Left = 296
    Top = 128
  end
end
