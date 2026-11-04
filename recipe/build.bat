REM Echo all output
@echo on

REM Configure project
cmake --fresh -G Ninja -D CMAKE_BUILD_TYPE=Release -B build\azure -S . %CMAKE_ARGS%

REM Build
cmake --build build\azure --parallel --target khiopsdriver_file_azure

REM Copy the lib for the driver package
cmake --install build\azure --prefix %PREFIX%\Library
