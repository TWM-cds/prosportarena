package model;
import java.io.Serializable;

public class Customer implements Serializable {

    private int id;
    private String name;
    private String email;
    private String password;
    private String memberLevel;

    public Customer() {}

    public Customer(String name,String email,String password,String memberLevel){
        this.name=name;
        this.email=email;
        this.password=password;
        this.memberLevel=memberLevel;
    }

    public int getId(){ return id; }
    public void setId(int id){ this.id=id; }

    public String getName(){ return name; }
    public void setName(String name){ this.name=name; }

    public String getEmail(){ return email; }
    public void setEmail(String email){ this.email=email; }

    public String getPassword(){ return password; }
    public void setPassword(String password){ this.password=password; }

    public String getMemberLevel(){ return memberLevel; }
    public void setMemberLevel(String memberLevel){ this.memberLevel=memberLevel; }

    // 🔥 Discount Calculation
    public double getDiscountRate(){
        if(memberLevel.equals("Gold")) return 0.10;
        if(memberLevel.equals("Silver")) return 0.05;
        return 0.0;
    }
}