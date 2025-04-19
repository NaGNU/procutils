//NaGNU by Nikita Shyshatksy (Holos) 24.03.25
program Sul;

uses
  SysUtils, Process;

var
  Command: string;
  ReturnCode: Integer;
  i: Integer;

begin
  if (ParamCount < 1) then
  begin
    WriteLn('Usage: sul <command>');
    Halt(1);
  end;

  Command := ParamStr(1);

  for i := 2 to ParamCount do
    Command := Command + ' ' + ParamStr(i);

  ReturnCode := ExecuteProcess('/usr/bin/sudo', Command);

  if ReturnCode <> 0 then
  begin
    WriteLn('Error executing command: ', ReturnCode);
    Halt(1);
  end
  else
  begin
    WriteLn('Command executed successfully');
  end;
end.
