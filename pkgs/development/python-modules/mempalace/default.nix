{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  chromadb,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "mempalace";
  version = "3.3.5";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-b/dPIvy4AXSXB96jH896GQO9rJRBHnN2UgA6s2LTyo4=";
  };

  build-system = [ hatchling ];

  dependencies = [
    chromadb
    pyyaml
  ];

  pythonImportsCheck = [ "mempalace" ];

  meta = with lib; {
    description = "Give your AI a memory — mine projects and conversations into a searchable palace";
    homepage = "https://github.com/MemPalace/mempalace";
    license = licenses.mit;
    mainProgram = "mempalace";
  };
}
