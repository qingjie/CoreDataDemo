ERROR:
*** Terminating app due to uncaught exception 'NSInternalInconsistencyException' reason: '-[UITableViewController loadView] loaded the "vXZ-lx-hvc-view-kh9-bI-dsS" nib but didn't get a UITableView.'

How to fix the error?
错误的含义是UITableViewController  没有 loadView这个方法，建议你把UITableViewController改成UIViewController