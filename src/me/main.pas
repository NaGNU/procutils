program MoveFile;

uses
  SysUtils, BaseUnix;

var
  SourceFile, DestinationDir, DestinationPath: string;
begin
  if ParamCount < 2 then
  begin
    Writeln('Usage: ./me [FILE] [DIRECTORY]');
    Halt(1);
  end;

  SourceFile := ParamStr(1);
  DestinationDir := ParamStr(2);

  if not FileExists(SourceFile) then
  begin
    Writeln('Error: Source file does not exist.');
    Halt(1);
  end;

  if not DirectoryExists(DestinationDir) then
  begin
    Writeln('Error: Destination directory does not exist.');
    Halt(1);
  end;

  DestinationPath := IncludeTrailingPathDelimiter(DestinationDir) + ExtractFileName(SourceFile);

  if RenameFile(SourceFile, DestinationPath) then
    Writeln('File moved successfully to ', DestinationPath)
  else
  begin
    Writeln('Error moving file: ', SysErrorMessage(Errno));
  end;
end.
