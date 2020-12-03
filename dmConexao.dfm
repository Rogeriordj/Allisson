object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 249
  Width = 405
  object FDConnection1: TFDConnection
    ConnectionName = 'FBConection'
    Params.Strings = (
      'Database=BASE_TESTE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Port=3050'
      'DriverID=IB')
    Left = 32
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Windows\System32\gds32.dll'
    Left = 136
    Top = 16
  end
end
