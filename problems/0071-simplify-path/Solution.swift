class Solution {
    func simplifyPath(_ path: String) -> String {
        var st = [Substring]()
        for part in path.split(separator: "/") {
            if part == "." { continue }
            if part == ".." {
                _ = st.popLast()
            } else {
                st.append(part)
            }
        }
        return "/" + st.joined(separator: "/")
    }
}
