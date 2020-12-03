unit NotaAlisson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  Data.DBXInterBase, Data.SqlExpr, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,dmConexao,
  Data.FMTBcd, FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf,
  FireDAC.Comp.Client, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  Vcl.StdCtrls, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Phys, Vcl.ComCtrls,
  FireDAC.Stan.StorageJSON, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, uLkJson, FireDAC.Phys.IBDef, FireDAC.Phys.IBWrapper;

type
  TfrmNotas = class(TForm)
    dsNotas: TDataSource;
    FDUpdateSQL1: TFDUpdateSQL;
    qryNotas: TFDQuery;
    qryConhecimento: TFDQuery;
    dsConhecimento: TDataSource;
    FDManager1: TFDManager;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    IdHTTP1: TIdHTTP;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    strGrid: TStringGrid;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet2Show(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure configurarGrid(rowCount: Integer; jsonObject: TlkJSONobject);
    procedure consultaViagens();
  public
    { Public declarations }
  end;

var
  frmNotas: TfrmNotas;

implementation

{$R *.dfm}

procedure TfrmNotas.configurarGrid(rowCount: Integer; jsonObject: TlkJSONobject);
var
  col, colWidth, i: Integer;
  nomeCampo: String;
begin
  strGrid.RowCount := rowCount;
  strGrid.ColCount := 27;

  for i := 0 to 26 do
  begin
    strGrid.Cells[i, 0] := jsonObject.NameOf[i];

    colWidth := 0;
    Case col of
      0 : colWidth := 30;
      1 : colWidth := 30;
      2 : colWidth := 30;
      3 : colWidth := 30;
      4 : colWidth := 30;
      5 : colWidth := 30;
      6 : colWidth := 30;
      7 : colWidth := 30;
      8 : colWidth := 30;
      9 : colWidth := 30;
      10 : colWidth := 30;
      11 : colWidth := 30;
      12 : colWidth := 30;
      13 : colWidth := 30;
      14 : colWidth := 30;
      15 : colWidth := 30;
      16 : colWidth := 30;
      17 : colWidth := 30;
      18 : colWidth := 30;
      19 : colWidth := 30;
      20 : colWidth := 30;
      21 : colWidth := 30;
      22 : colWidth := 30;
      23 : colWidth := 30;
      24 : colWidth := 30;
      25 : colWidth := 30;
      26 : colWidth := 320;
    end;
  end;
end;

procedure TfrmNotas.consultaViagens();
var
  Str: string;
  http: TidHttp;
  jsonList: TlkJSONlist;
  jsonObject: TlkJSONobject;
  i, col, colWidth: Integer;
  nomeCampo: String;
begin
  http := TIdHTTP.Create;

  try
    Str := http.Get('http://portalallisson.ddns.com.br/mobile-api-demo/viagens/MTZ/8');
    jsonList := TlkJSON.ParseText(Str) as TlkJSONlist;

    if Assigned(jsonList) then
    begin
      jsonObject := jsonList.child[0] as TlkJSONobject;
      configurarGrid(jsonList.count + 1, jsonObject);

      for i:=0 to jsonList.count-1 do
      begin
        jsonObject := jsonList.child[i] as TlkJSONobject;

        for col := 0 to 26 do
        begin
          nomeCampo := jsonObject.NameOf[col];
          strGrid.Cells[col, i+1] := VarToStr(jsonObject.Field[nomeCampo].Value);

          colWidth := 0;
          Case col of
            0 : colWidth := 30;
            1 : colWidth := 30;
            2 : colWidth := 30;
            3 : colWidth := 30;
            4 : colWidth := 30;
            5 : colWidth := 30;
            6 : colWidth := 30;
            7 : colWidth := 30;
            8 : colWidth := 30;
            9 : colWidth := 30;
            10 : colWidth := 30;
            11 : colWidth := 30;
            12 : colWidth := 30;
            13 : colWidth := 30;
            14 : colWidth := 30;
            15 : colWidth := 30;
            16 : colWidth := 30;
            17 : colWidth := 30;
            18 : colWidth := 30;
            19 : colWidth := 30;
            20 : colWidth := 30;
            21 : colWidth := 30;
            22 : colWidth := 30;
            23 : colWidth := 30;
            24 : colWidth := 30;
            25 : colWidth := 30;
            26 : colWidth := 320;
          end;

          strGrid.ColWidths[col] :=  colWidth;
        end;
      end;
    end;
  finally
    http.Free;
  end;
end;

procedure TfrmNotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryNotas.Close;
  qryConhecimento.Close;
end;

procedure TfrmNotas.FormCreate(Sender: TObject);
var
  appPath: String;
begin
  Application.CreateForm(TdtmConexao, dtmConexao);
  appPath := ExtractFilePath(ParamStr(0));

  dtmConexao.FDConnection1.DriverName := 'IB';
  With dtmConexao.FDConnection1.Params as TFDPhysIBConnectionDefParams do
  begin
    Protocol := ipTCPIP;
    Server := '127.0.0.1';
    Database := appPath + 'BASE_TESTE.FDB';
    UserName := 'SYSDBA';
    Password := 'masterkey';
    Port     := 3050
  end;
  dtmConexao.FDConnection1.Connected := True;

  self.qryNotas.Open;
  self.qryConhecimento.Open;
end;

procedure TfrmNotas.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmNotas.TabSheet2Show(Sender: TObject);
begin
  Self.consultaViagens();
end;

end.
