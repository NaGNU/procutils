program TouchFile;

uses
  SysUtils;

var
  FileName: string;
begin
  if ParamCount < 1 then
  begin
    WriteLn('Usage: ./touchf [FILE_NAME]');
    Halt(1);
  end;

  FileName := ParamStr(1);

  if not FileExists(FileName) then
  begin
    if FileCreate(FileName) = -1 then
    begin
      WriteLn('Error creating file: ', FileName);
      Halt(1);
    end;
    WriteLn('File created: ', FileName);
  end
  else
  begin
    FileSetDate(FileName, DateTimeToFileDate(Now));
    WriteLn('File already exists: ', FileName);
  end;
end.
