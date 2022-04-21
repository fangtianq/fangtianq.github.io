package snippet;

public class Snippet {

    public static void main(String[] args) {
        String string = "省（区、市）委党校大学、省（区、市）委党校2大学";
//		String replaceAll = string.replaceAll("（[^）]*）","CHEMBO");
        String[] split = string.split("");
        boolean flag = false;
        StringBuilder tmpStr = new StringBuilder();
        for (int i = 0; i < split.length; i++) {
            String string2 = split[i];
            if("）".equals(string2)) {
                flag = true;
            }
            if("（".equals(string2)) {
                flag = false;
            }
            if(flag&&"、".equals(string2)) {
                string2 = "@@@";
            }
            tmpStr.append(string2);
        }
        System.out.println(tmpStr);
        System.out.println(tmpStr.toString().replace("@@@", "、"));

    }
}

