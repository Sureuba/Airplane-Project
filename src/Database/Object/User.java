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
        this.login = login;
        this.address = address;
        this.Registered = Registered;
        this.dateOfBirth = dateOfBirth;
        this.phoneNum = phoneNum;
    
    } 
    
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setLogin(Singleton_Login login) {
        this.login = login;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public void setRegistered(boolean registered) {
        this.registered = registered;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    // Getters
    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public Singleton_Login getLogin() {
        return login;
    }

    public Address getAddress() {
        return address;
    }

    public boolean isRegistered() {
        return registered;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public String getPhoneNum() {
        return phoneNum;
    }


}
