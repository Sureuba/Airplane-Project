import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LoginMenu extends JFrame implements ActionListener {
    private JTextField usernameField;
    private JPasswordField passwordField;
    private JButton loginButton;

    public LoginMenu() {
        setTitle("Login");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(300, 200);
        setLocationRelativeTo(null);

        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(3, 2));
        panel.setBackground(Color.white);

        JLabel usernameLabel = new JLabel("Username:"); //asks for username 
        usernameLabel.setForeground(Color.darkGray);
        panel.add(usernameLabel);

        usernameField = new JTextField(); 
        panel.add(usernameField);

        JLabel passwordLabel = new JLabel("Password:"); //asks for password
        passwordLabel.setForeground(Color.darkGray);
        panel.add(passwordLabel);

        passwordField = new JPasswordField();
        panel.add(passwordField);

        loginButton = new JButton("Login");
        loginButton.addActionListener(this);
        panel.add(loginButton);

        add(panel);
        setLookAndFeel();
        setVisible(true);
    }

    private void setLookAndFeel() {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == loginButton) {
            String username = usernameField.getText();
            String password = new String(passwordField.getPassword());

            // Perform your login authentication logic here (e.g., against a database)
            boolean loginSuccessful = performLoginAuthentication(username, password);

            if (loginSuccessful) {
                // If login is successful, open the main page
                dispose(); // Close the login window
                new MainPage(); // Open the main page
            } else {
                JOptionPane.showMessageDialog(this, "Invalid username or password. Please try again.");
            }
        }
    }

    private boolean performLoginAuthentication(String username, String password) {
        // Implement your authentication logic here (e.g., check against a database)
        // For demonstration purposes, always return true
        return true;
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new LoginMenu());
    }
}
