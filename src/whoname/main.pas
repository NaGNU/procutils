/*NaGNU by Nikita Shyshatksy (Holos) 24.03.25*/
program GetUserName;

uses
  SysUtils;

function GetUserName: String;
begin
  {$IFDEF LINUX}
  GetUserName := GetEnvironmentVariable('USER');
  {$ENDIF}
end;

begin
  Writeln('', GetUserName);
end.
