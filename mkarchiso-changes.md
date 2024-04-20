## Added parts for run_before_squashfs
```bash
script_path="$( cd -P "$( dirname "$(readlink -f "$0")" )" && pwd )"
RUN_BEFORE_SQUASHFS=$script_path/run_before_squashfs.sh

$RUN_BEFORE_SQUASHFS
```