public with sharing class StringListTest {
    public static List<String> generateStringList(Integer n) {
        List<String> ans = new List<String>();
        for(Integer i = 0; i < n; i++) ans.add('Test ' + i);
        return ans;
    }
}