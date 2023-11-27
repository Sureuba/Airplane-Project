package Object;
import java.util.Date;



public class User {
    private String fullName;
    private String email;
    private Singleton_Login login;
    private Address address;
    private boolean Registered; 
    private Date dateOfBirth;
    private String phoneNum;


    
    public User(String fullName, String email,Singleton_Login login,Address address,boolean Registered, Date dateOfBirth, String phoneNum, Address address) {
        this.fullName = fullName;
        this.email = email;
        this.login = new login;
        this.address = address;
        this.Registered = Registered;
        this.dateOfBirth = dateOfBirth;
        this.phoneNum = phoneNum;
    
    } 
    



}
