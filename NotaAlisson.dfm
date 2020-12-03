object frmNotas: TfrmNotas
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Allisson Sistemas'
  ClientHeight = 472
  ClientWidth = 1058
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1058
    Height = 472
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Notas e Conhecimento'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1050
        Height = 41
        Align = alTop
        Caption = 'Notas Fiscais'
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 41
        Width = 1050
        Height = 180
        Align = alClient
        DataSource = dsNotas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_CONHECIMENTO'
            Title.Caption = 'ID Conhecimento'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_EMISSAO'
            Title.Caption = 'Data Emiss'#227'o'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ALTERACAO'
            Title.Caption = 'Data Altera'#231#227'o'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAVE_ACESSO_NFE'
            Title.Caption = 'Chave da NFE'
            Width = 272
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VOLUMES'
            Title.Caption = 'Volumes'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_MERCADORIA'
            Title.Caption = 'Valor Mercadoria'
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 221
        Width = 1050
        Height = 41
        Align = alBottom
        Caption = 'Conhecimento de Transporte'
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 262
        Width = 1050
        Height = 182
        Align = alBottom
        DataSource = dsConhecimento
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_CTO'
            Title.Caption = 'Nr'#186' Conhecimento'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Title.Caption = 'S'#233'rie'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FILIAL'
            Title.Caption = 'Filial'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_DESTINATARIO'
            Title.Caption = 'Destinat'#225'rio'
            Width = 272
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_REMETENTE'
            Title.Caption = 'Remetente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERADOR'
            Title.Caption = 'Operador'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ALTERACAO'
            Title.Caption = 'Data Altera'#231#227'o'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Viagens'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object strGrid: TStringGrid
        Left = 0
        Top = 41
        Width = 1050
        Height = 403
        Align = alClient
        ColCount = 1
        FixedColor = clSilver
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1050
        Height = 41
        Align = alTop
        Caption = 'Viagens'
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object dsNotas: TDataSource
    DataSet = qryNotas
    Left = 568
    Top = 105
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = dtmConexao.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO "NOTA FISCAL"'
      '(ID_CONHECIMENTO, CHAVE_ACESSO_NFE, DT_EMISSAO, '
      '  VLR_MERCADORIA, VOLUMES, DT_ALTERACAO)'
      
        'VALUES (:NEW_ID_CONHECIMENTO, :NEW_CHAVE_ACESSO_NFE, :NEW_DT_EMI' +
        'SSAO, '
      '  :NEW_VLR_MERCADORIA, :NEW_VOLUMES, :NEW_DT_ALTERACAO)'
      
        'RETURNING ID_CONHECIMENTO, CHAVE_ACESSO_NFE, DT_EMISSAO, VLR_MER' +
        'CADORIA, VOLUMES, DT_ALTERACAO')
    ModifySQL.Strings = (
      'UPDATE "NOTA FISCAL"'
      
        'SET ID_CONHECIMENTO = :NEW_ID_CONHECIMENTO, CHAVE_ACESSO_NFE = :' +
        'NEW_CHAVE_ACESSO_NFE, '
      
        '  DT_EMISSAO = :NEW_DT_EMISSAO, VLR_MERCADORIA = :NEW_VLR_MERCAD' +
        'ORIA, '
      '  VOLUMES = :NEW_VOLUMES, DT_ALTERACAO = :NEW_DT_ALTERACAO'
      'WHERE ID = :OLD_ID'
      
        'RETURNING ID_CONHECIMENTO, CHAVE_ACESSO_NFE, DT_EMISSAO, VLR_MER' +
        'CADORIA, VOLUMES, DT_ALTERACAO')
    DeleteSQL.Strings = (
      'DELETE FROM "NOTA FISCAL"'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ID_CONHECIMENTO, CHAVE_ACESSO_NFE, DT_EMISSAO, VLR_ME' +
        'RCADORIA, '
      '  VOLUMES, DT_ALTERACAO'
      'FROM "NOTA FISCAL"'
      'WHERE ID = :OLD_ID')
    Left = 640
    Top = 105
  end
  object qryNotas: TFDQuery
    Connection = dtmConexao.FDConnection1
    UpdateOptions.AssignedValues = [uvGeneratorName, uvAutoCommitUpdates]
    UpdateOptions.GeneratorName = '"GEN_NOTA FISCAL_ID"'
    UpdateOptions.AutoCommitUpdates = True
    SQL.Strings = (
      'SELECT NF.* FROM "NOTA FISCAL" NF')
    Left = 496
    Top = 105
  end
  object qryConhecimento: TFDQuery
    IndexFieldNames = 'ID'
    MasterSource = dsNotas
    MasterFields = 'ID_CONHECIMENTO'
    Connection = dtmConexao.FDConnection1
    UpdateOptions.AssignedValues = [uvGeneratorName, uvAutoCommitUpdates]
    UpdateOptions.GeneratorName = '"GEN_NOTA FISCAL_ID"'
    UpdateOptions.AutoCommitUpdates = True
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'SELECT * FROM CONHECIMENTO c '
      'INNER JOIN "NOTA FISCAL" NF ON NF.ID_CONHECIMENTO=C.ID')
    Left = 528
    Top = 305
  end
  object dsConhecimento: TDataSource
    DataSet = qryConhecimento
    Left = 632
    Top = 305
  end
  object FDManager1: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 424
    Top = 105
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 532
    Top = 224
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 628
    Top = 224
  end
end
