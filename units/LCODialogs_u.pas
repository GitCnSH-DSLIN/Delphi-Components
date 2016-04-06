{************************************************************************}
{                                                                        }
{     Delphi Visual Component Library                                    }
{     Copyright (c) 1995,96 Borland International                        }
{                                                                        }
{     English/Russian/Portuguese/Turkish/German/French/Greek/Spanish/... }
{       message/input dialogs                                            }
{     Tiny portions by Andrew Anoshkin '1997-98                          }
{     Portuguese translation by Renato M. Prado                          }
{     Turkish translation by Egemen �EN                                  }
{���� German translation by Godfrey McLean�����������������������������  }
{     Dutch translation by Leonard Wennekers                             }
{���� French translation by Jean-Fabien Connault�����������������������  }
{     Greek translation by Babis Michail                                 }
{     Spanish translation by Jorge R. Lopez Danieluk                     }
{                                                                        }
{************************************************************************}

unit LCODialogs_u;
{
  2002-04-07        Larsson Consulting modified it to define language once and
                    have the option of using a default button. Translation to swedish
                    have also been made. Constants for modal buttons is for Delphi 5.
  2002-04-08        Define language once for InputQueryI as well.


  2011-09-04 Delphi XE har �ven   , 'Close' i deklarationen.. men denna unit �r kanske
  overkill numera????



}

interface

//Remove the dot if Brad Stowers's TBrowseDirectoryDlg is installed
{.$DEFINE USE_BROWSEDR}



{$IFNDEF VER80}
 {$IFNDEF VER90}
  {$IFNDEF VER93}
    {$DEFINE A_D3} { Delphi 3.0 or higher }
  {$ENDIF}
 {$ENDIF}
{$ENDIF}

uses Windows, SysUtils, Consts, Classes, Controls, Graphics, Dialogs, Forms,
     StdCtrls, ExtCtrls {$IFDEF USE_BROWSEDR}, BrowseDr{$ENDIF};



{ Message/Input dialogs }

type
  TLangType = (ltEnglish, ltRussian, ltPortuguese, ltTurkish, ltGerman, ltDutch, ltFrench,
    ltGreek, ltSpanish, ltSwedish);

const

//International section

  //*** English TEMPLATE
  sCancelCaptionE = 'Cancel';
  CaptionsE: array[TMsgDlgType] of string = ('Warning', 'Error',
    'Information', 'Confirm', '');
  {$IFDEF A_D3}
  ButtonCaptionsE: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All',
    'No to all', 'Yes to all', 'Help'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsE: array[TMsgDlgBtn] of string= (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'Help');
  {$ENDIF}


  //*** Russian
  sCancelCaptionR = '������';
  CaptionsR: array[TMsgDlgType] of string = ( '��������������', '������',
    '����������', '�������������', '' );
  {$IFDEF A_D3}
  ButtonCaptionsR: array[TMsgDlgBtn] of string = (
    '��', '���', 'OK', '������', '����', '������', '����������', '���',
    '��� ��� ����', '�� ��� ����', '�������'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsR: array[TMsgDlgBtn] of string = (
    '��', '���', 'OK', '������', '����', '������', '����������', '���', '�������');
  {$ENDIF}


  //*** Portuguese
  sCancelCaptionP = 'Cancela';
  CaptionsP: array[TMsgDlgType] of string = ( 'Aviso', 'Erro',
    'Informa��o', 'Confirma��o', '' );
  {$IFDEF A_D3}
  ButtonCaptionsP: array[TMsgDlgBtn] of string = (
    'Sim', 'N�o', 'OK', 'Cancela', 'Aborta', 'Tenta Novamente', 'Ignora', 'Tudo',
    'N�o para Tudo', 'Sim para Tudo', 'Ajuda'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsP: array[TMsgDlgBtn] of string = (
    'Sim', 'N�o', 'OK', 'Cancela', 'Aborta', 'Tenta Novamente', 'Ignora', 'Tudo', 'Ajuda');
  {$ENDIF}


  //*** Turkish
  sCancelCaptionT = 'Vazge�';
  CaptionsT: array[TMsgDlgType] of string = ('Uyar�', 'Hata',
    'Bilgi', 'Do�rulama', '');
  {$IFDEF A_D3}
  ButtonCaptionsT: array[TMsgDlgBtn] of string = (
    'Evet', 'Hay�r', 'TAMAM', 'Vazge�', 'Durdur', 'Tekrar', '�ptal', 'Hepsi',
    'Hepsine hay�r', 'Hepsine evet', 'Yard�m'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsT: array[TMsgDlgBtn] of string= (
    'Evet', 'Hay�r', 'TAMAM', 'Vazge�', 'Durdur', 'Tekrar', '�ptal', 'Hepsi', 'Yard�m');
  {$ENDIF}


  //*** German
  sCancelCaptionG = 'Abbrechen';
  CaptionsG: array[TMsgDlgType] of string = ('Warnung', 'Fehler',
    'Information', 'Best�tigung', '');
  {$IFDEF A_D3}
  ButtonCaptionsG: array[TMsgDlgBtn] of string = (
    'Ja', 'Nein', 'OK', 'Abbrechen', 'Abbrechen', 'Wiederholen', 'Ignorieren', 'Alle',
    'Nein zu allen', 'Ja zu allen', 'Hilfe'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsG: array[TMsgDlgBtn] of string= ( // Abbrechen = Abort = Cancel
    'Ja', 'Nein', 'OK', 'Abbrechen', 'Abbrechen', 'Wiederholen', 
    'Ignorieren', 'Alle', 'Hilfe');
  {$ENDIF}


  //*** Dutch
  sCancelCaptionD = 'Annuleren';
  CaptionsD: array[TMsgDlgType] of string = ('Waarschuwing', 'Fout',
    'Informatie', 'Bevestiging', '');
  {$IFDEF A_D3}
  ButtonCaptionsD: array[TMsgDlgBtn] of string = (
    'Ja', 'Nee', 'OK', 'Annuleren', 'Afbreken', 'Herhalen', 'Negeren', 'Alles',
    'Nee op alles', 'Ja op alles', '?'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsD: array[TMsgDlgBtn] of string= (
  'Ja', 'Nee', 'OK', 'Annuleren', 'Afbreken', 'Herhalen', 'Negeren', 'Alles', '?');
  {$ENDIF}


  //*** French
  sCancelCaptionF = 'Annuler';
  CaptionsF: array[TMsgDlgType] of string = ('Avertissement', 'Erreur',
    'Information', 'Confirmation', '');
  {$IFDEF A_D3}
  ButtonCaptionsF: array[TMsgDlgBtn] of string = (
    'Oui', 'Non', 'OK', 'Annuler', 'Abandonner', 'R�essayer', 'Ignorer', 'Tout',
    'Non pour tous', 'Oui pour tous', 'Aide'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsF: array[TMsgDlgBtn] of string= (
    'Oui', 'Non', 'OK', 'Annuler', 'Abandonner', 'Retry', 'Ignorer', 'Tout', 'Aide');
  {$ENDIF}


  //*** Greek
  sCancelCaptionGr = '�����';
  CaptionsGr: array[TMsgDlgType] of string = ('�������!', '�����',
    '����������', '�����������', '');
  {$IFDEF A_D3}
  ButtonCaptionsGr: array[TMsgDlgBtn] of string = (
    '���', '���', '�������', '�����', '�������', '����������', '�������', '���',
    '��� �� ���', '��� �� ���', '�������'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsGr: array[TMsgDlgBtn] of string= (
    '���', '���', '�������', '�����', '�������', '����������', '�������', '���', '�������');
  {$ENDIF}


  //*** Spanish
  sCancelCaptionS = 'Cancelar';
  CaptionsS: array[TMsgDlgType] of string = ('Precauci�n', 'Error',
    'Informaci�n', 'Confirmaci�n', '');
  {$IFDEF A_D3}
  ButtonCaptionsS: array[TMsgDlgBtn] of string = (
    'Si', 'No', 'OK', 'Cancelar', 'Abortar', 'Reintentar', 'Ignorar', 'Todo',
    'No a todo', 'Si a todo', 'Ayuda'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsS: array[TMsgDlgBtn] of string= (
    'Si', 'No', 'OK', 'Cancelar', 'Abortar', 'Reintentar', 'Ignorar', 'Todo', 'Ayuda');
  {$ENDIF}


//*** Swedish
  sCancelCaptionSE = 'Avbryt'{'Cancel'};
  CaptionsSE: array[TMsgDlgType] of string = ('Varning'{'Warning'}, 'Fel'{'Error'},
    'Information', 'Bekr�fta'{'Confirm'}, '');
  {$IFDEF A_D3}
  ButtonCaptionsSE: array[TMsgDlgBtn] of string = (
    'Ja'{'Yes'}, 'Nej'{'No'}, 'OK', 'Avbryt'{'Cancel'}, 'Avbryt'{'Abort'},
    'F�rs�k Igen' {'Retry'}, 'Ignorera'{'Ignore'}, 'Alla'{'All'},
    'Nej till alla'{'No to all'}, 'Ja till alla'{'Yes to all'}, 'Hj�lp'{'Help'}{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonCaptionsSE: array[TMsgDlgBtn] of string= (
    'Ja', 'Nej', 'OK', 'Avbryt', 'Avbryt', 'F�rs�k Igen'{?}, 'Ignorera', 'Alla', 'Hj�lp');
//    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'Help');
  {$ENDIF}

//***



function MessageDlgI(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; pDefaultButton: ShortInt): Integer;
function MessageDlgPosI(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer; pDefaultButton: ShortInt): Integer;


function getLangCode: string;

//
//
//
{$IFDEF USE_BROWSEDR}
function InputFolderI(const Title, InitialFolder: string): string;
function InputFolderIEx(Owner: TComponent; const Title, InitialFolder: string): string;
{$ENDIF}

function InputQueryI(const ACaption, APrompt: string;
  var Value: string): Boolean;
function InputBoxI(const ACaption, APrompt, ADefault: string; Lang: TLangType): string;

function CreateMessageDialogI(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; pDefaultButton: ShortInt): TForm;

var
  UseLanguage: TLangType;

const
  FOCUS_NONE            = -1;
  FOCUS_MBYES           = 0;
  FOCUS_MBNO            = 1;
  FOCUS_MBOK            = 2;
  FOCUS_MBCANCEL        = 3;
  FOCUS_MBABORT         = 4;
  FOCUS_MBRETRY         = 5;
  FOCUS_MBIGNORE        = 6;
  FOCUS_MBALL           = 7;
  FOCUS_MBNOTOALL       = 8;
  FOCUS_MBYESTOALL      = 9;
  FOCUS_MBHELP          = 10;


implementation


function Max(I, J: Integer): Integer;
begin
  if I > J then Result := I else Result := J;
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;


type
  TMessageForm = class(TForm)
  private
    procedure HelpButtonClick(Sender: TObject);
  public
    constructor CreateNew(AOwner: TComponent);
  end;


constructor TMessageForm.CreateNew(AOwner: TComponent);
var
  NonClientMetrics: TNonClientMetrics;
begin
  inherited CreateNew(AOwner);
  NonClientMetrics.cbSize := sizeof(NonClientMetrics);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
    Font.Handle := CreateFontIndirect(NonClientMetrics.lfMessageFont);
end;


procedure TMessageForm.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;


function CreateMessageDialogI(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; pDefaultButton: ShortInt): TForm;
const
  mcHorzMargin = 8;
  mcVertMargin = 8;
  mcHorzSpacing = 10;
  mcVertSpacing = 10;
  mcButtonWidth = 50;
  mcButtonHeight = 14;
  mcButtonSpacing = 4;
const
  IconIDs: array[TMsgDlgType] of PChar = (IDI_EXCLAMATION, IDI_HAND,
    IDI_ASTERISK, IDI_QUESTION, nil);

  {$IFDEF A_D3}
  ButtonNames: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
    'YesToAll', 'Help'{$IFDEF VER220}, 'Close'{$ENDIF});
  {$ELSE}
  ButtonNames:  array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'Help');
  {$ENDIF}

  {$IFDEF A_D3}
  ModalResults: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll,
    mrYesToAll, 0, mrClose);
  {$ELSE}
  ModalResults: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, 0);
  {$ENDIF}
var
  DialogUnits: TPoint;
  HorzMargin, VertMargin, HorzSpacing, VertSpacing, ButtonWidth,
  ButtonHeight, ButtonSpacing, ButtonCount, ButtonGroupWidth,
  IconTextWidth, IconTextHeight, X: Integer;
  B, DefaultButton, CancelButton,
  lButton: TMsgDlgBtn;
  IconID: PChar;
  TextRect: TRect;
  FocusControlName: String;
  lButtonIndex: Integer;
begin
  Result := TMessageForm.CreateNew(Application);
  with Result do
  begin
    BorderStyle := bsDialog;
    Canvas.Font := Font;
    DialogUnits := GetAveCharSize(Canvas);
    HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
    VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
    HorzSpacing := MulDiv(mcHorzSpacing, DialogUnits.X, 4);
    VertSpacing := MulDiv(mcVertSpacing, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(mcButtonWidth, DialogUnits.X, 4);
    ButtonHeight := MulDiv(mcButtonHeight, DialogUnits.Y, 8);
    ButtonSpacing := MulDiv(mcButtonSpacing, DialogUnits.X, 4);
    SetRect(TextRect, 0, 0, Screen.Width div 2, 0);
    DrawText(Canvas.Handle, PChar(Msg), -1, TextRect,
      DT_CALCRECT or DT_WORDBREAK);
    IconID := IconIDs[DlgType];
    IconTextWidth := TextRect.Right;
    IconTextHeight := TextRect.Bottom;
    if IconID <> nil then
    begin
      Inc(IconTextWidth, 32 + HorzSpacing);
      if IconTextHeight < 32 then IconTextHeight := 32;
    end;
    ButtonCount := 0;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then Inc(ButtonCount);
    ButtonGroupWidth := 0;
    if ButtonCount <> 0 then
      ButtonGroupWidth := ButtonWidth * ButtonCount +
        ButtonSpacing * (ButtonCount - 1);
    ClientWidth := Max(IconTextWidth, ButtonGroupWidth) + HorzMargin * 2;
    ClientHeight := IconTextHeight + ButtonHeight + VertSpacing +
      VertMargin * 2;
    Left := (Screen.Width div 2) - (Width div 2);
    Top := (Screen.Height div 2) - (Height div 2);

    if DlgType <> mtCustom then
      //Support International
      case UseLanguage of
        ltRussian:
          Caption := CaptionsR[DlgType];
        ltPortuguese:
          Caption := CaptionsP[DlgType];
        ltTurkish:
          Caption := CaptionsT[DlgType];
        ltGerman:
          Caption := CaptionsG[DlgType];
        ltDutch:
          Caption := CaptionsD[DlgType];
        ltFrench:
          Caption := CaptionsF[DlgType];
        ltGreek:
          Caption := CaptionsGr[DlgType];
        ltSpanish:
          Caption := CaptionsS[DlgType];
        ltSwedish:
          Caption := CaptionsSE[DlgType]
      else //ltEnglish
          Caption := CaptionsE[DlgType]
      end//end of Case
    else
      Caption := Application.Title;

    if IconID <> nil then
      with TImage.Create(Result) do
      begin
        Name := 'Image';
        Parent := Result;
        Picture.Icon.Handle := LoadIcon(0, IconID);
        SetBounds(HorzMargin, VertMargin, 32, 32);
      end;
    with TLabel.Create(Result) do
    begin
      Name := 'Message';
      Parent := Result;
      WordWrap := True;
      Caption := Msg;
      BoundsRect := TextRect;
      SetBounds(IconTextWidth - TextRect.Right + HorzMargin, VertMargin,
        TextRect.Right, TextRect.Bottom);
    end;

//    DefaultButton := pDefaultButton

    if mbOk in Buttons then DefaultButton := mbOk else
      if mbYes in Buttons then DefaultButton := mbYes else
        DefaultButton := mbRetry;
    if mbCancel in Buttons then CancelButton := mbCancel else
      if mbNo in Buttons then CancelButton := mbNo else
        CancelButton := mbOk;

    X := (ClientWidth - ButtonGroupWidth) div 2;
{    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then
        with TButton.Create(Result) do
        begin
          Name := ButtonNames[B];
          Parent := Result;

          //Support International
          case UseLanguage of
            ltRussian:
              Caption := ButtonCaptionsR[B];
            ltPortuguese:
              Caption := ButtonCaptionsP[B];
            ltTurkish:
              Caption := ButtonCaptionsT[B];
            ltGerman:
              Caption := ButtonCaptionsG[B];
            ltDutch:
              Caption := ButtonCaptionsD[B];
            ltFrench:
              Caption := ButtonCaptionsF[B];
            ltGreek:
              Caption := ButtonCaptionsGr[B];
            ltSpanish:
              Caption := ButtonCaptionsS[B];
            ltSwedish:
              Caption := ButtonCaptionsSE[B];
          else //ltEnglish
              Caption := ButtonCaptionsE[B];
          end;

          ModalResult := ModalResults[B];
          if B = DefaultButton then Default := True;
          if B = CancelButton then Cancel := True;
          SetBounds(X, IconTextHeight + VertMargin + VertSpacing,
            ButtonWidth, ButtonHeight);
          Inc(X, ButtonWidth + ButtonSpacing);
          if B = mbHelp then
            OnClick := TMessageForm(Result).HelpButtonClick;

          if B = TMsgDlgBtn(pDefaultButton) then
            FocusControlName := ButtonNames[B];

        end;}


    //This one steps through the possible buttons instead of the
    //buttons that I actually wants, hence making wrong order
                                     {
    for lButtonIndex := 0 to High(Buttons) do
    begin

    end;
       set                          }

    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
//    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then
        with TButton.Create(Result) do
        begin
          Name := ButtonNames[B];
          Parent := Result;

          //Support International
          case UseLanguage of
            ltRussian:
              Caption := ButtonCaptionsR[B];
            ltPortuguese:
              Caption := ButtonCaptionsP[B];
            ltTurkish:
              Caption := ButtonCaptionsT[B];
            ltGerman:
              Caption := ButtonCaptionsG[B];
            ltDutch:
              Caption := ButtonCaptionsD[B];
            ltFrench:
              Caption := ButtonCaptionsF[B];
            ltGreek:
              Caption := ButtonCaptionsGr[B];
            ltSpanish:
              Caption := ButtonCaptionsS[B];
            ltSwedish:
              Caption := ButtonCaptionsSE[B];
          else //ltEnglish
              Caption := ButtonCaptionsE[B];
          end;

          ModalResult := ModalResults[B];
          if B = DefaultButton then Default := True;
          if B = CancelButton then Cancel := True;
          SetBounds(X, IconTextHeight + VertMargin + VertSpacing,
            ButtonWidth, ButtonHeight);
          Inc(X, ButtonWidth + ButtonSpacing);
          if B = mbHelp then
            OnClick := TMessageForm(Result).HelpButtonClick;

          if B = TMsgDlgBtn(pDefaultButton) then
            FocusControlName := ButtonNames[B];

        end;
        

    if FocusControlName <> '' then
      ActiveControl := TWinControl(Result.FindComponent(FocusControlName));

  end;



end;


function MessageDlgI(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; pDefaultButton: ShortInt): Integer;
begin
  Result := MessageDlgPosI(Msg, DlgType, Buttons, HelpCtx, -1, -1, pDefaultButton);
end;


function MessageDlgPosI(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer; pDefaultButton: ShortInt): Integer;
begin
  with CreateMessageDialogI(Msg, DlgType, Buttons, pDefaultButton) do
    try
      HelpContext := HelpCtx;
      if X >= 0 then Left := X;
      if Y >= 0 then Top := Y;
      Result := ShowModal;
    finally
      Free;
    end;
end;


{ Input dialog }

function InputQueryI(const ACaption, APrompt: string;
  var Value: string): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := True;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
      end;
      Edit := TEdit.Create(Form);
      with Edit do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        Text := Value;
        SelectAll;
      end;
      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        {$IFDEF A_D3}
        Caption := SMsgDlgOK;
        {$ELSE}
        Caption := LoadStr(SMsgDlgOK);
        {$ENDIF}
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;

        //International support
        case UseLanguage of
          ltRussian:
            Caption := sCancelCaptionR;
          ltPortuguese:
            Caption := sCancelCaptionP;
          ltTurkish:
            Caption := sCancelCaptionT;
          ltGerman:
            Caption := sCancelCaptionG;
          ltDutch:
            Caption := sCancelCaptionD;
          ltFrench:
            Caption := sCancelCaptionF;
          ltGreek:
            Caption := sCancelCaptionGr;
          ltSpanish:
            Caption := sCancelCaptionS;
          ltSwedish:
            Caption := sCancelCaptionSE;
        else //ltEnglish
            Caption := sCancelCaptionE;
        end;

        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Text;
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;


function InputBoxI(const ACaption, APrompt, ADefault: string; Lang: TLangType): string;
begin
  Result := ADefault;
  InputQueryI(ACaption, APrompt, Result);
end;


{$IFDEF USE_BROWSEDR}
//
//
//
function InputFolderI(const Title, InitialFolder: string): string;
var
  dlg: TBrowseDirectoryDlg;
begin
  Result := '';
  dlg := TBrowseDirectoryDlg.Create(Application);
  try
    dlg.Title := Title;
    dlg.Options := dlg.Options + [bfDirectoriesOnly];
    if InitialFolder <> '' then
      dlg.Selection := InitialFolder;
    if dlg.Execute then
      Result := dlg.Selection;
  finally
    dlg.Free;
  end;
end;


function InputFolderIEx(Owner: TComponent; const Title, InitialFolder: string): string;
var
  dlg: TBrowseDirectoryDlg;
begin
  Result := '';
  dlg := TBrowseDirectoryDlg.Create(Owner);
  try
    dlg.Title := Title;
    dlg.Options := dlg.Options + [bfDirectoriesOnly];
    if InitialFolder <> '' then
      dlg.Selection := InitialFolder;
    if dlg.Execute then
      Result := dlg.Selection;
  finally
    dlg.Free;
  end;
end;

{$ENDIF}



function getLangCode: string;
begin

  case UseLanguage of
  ltSwedish: Result := 'sv';
  ltEnglish: Result := 'en';
  else
    Result := 'en';
  end;

end;
end.
