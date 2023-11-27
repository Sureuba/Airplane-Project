package Object;
import java.util.ArrayList;

public class Singleton_Login {
    private static Singleton_Login onlyInstance;
    private ArrayList<String> passwords;
    private ArrayList<String> emails;


    //From class notes
    public static Singleton_Login getOnlyInstance()
    {
        if (onlyInstance == null)
        {
            onlyInstance = new Singleton_Login();
        }
        return onlyInstance;
    }

    
    private Singleton_Login() {
        this.passwords = new ArrayList<>();
        this.emails = new ArrayList<>();
    }


    // Not saved to database
    public void addCostumer(String email, String password) {

        this.emails.add(email); 
        this.passwords.add(password);
    }


    public boolean isValidUser(String email, String password) {  
        int index = emails.indexOf(email);
        if (index != -1) {
            return passwords.get(index).equals(password);
        }
        return false; // No email
    }



    public ArrayList<String> getEmails() {
        return this.emails;
    }

    public void setEmails(ArrayList<String> emails) {
        this.emails = emails;
    }

    public ArrayList<String> getPasswords() {
        return this.passwords;
    }

    public void setPasswords(ArrayList<String> passwords) {
        this.passwords = passwords;
    }
}
