func check(_ p: String, _ want: String, line: UInt = #line) {
    let got = Solution().simplifyPath(p)
    precondition(got == want, "line \(line): '\(p)': got '\(got)', want '\(want)'")
}

check("/home/", "/home")
check("/home//foo/", "/home/foo")
check("/home/user/Documents/../Pictures", "/home/user/Pictures")
check("/../", "/")
check("/.../a/../b/c/../d/./", "/.../b/d")
check("/", "/")
check("/a/./b/../../c/", "/c")
check("/..hidden/.", "/..hidden")
print("OK")
