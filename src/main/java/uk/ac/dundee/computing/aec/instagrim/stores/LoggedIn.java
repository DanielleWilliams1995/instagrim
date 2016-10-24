/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;

import java.util.Set;
import java.util.UUID;

/**
 *
 * @author Danielle
 */
public class LoggedIn {

    boolean logedin = false;
    String Username = null;
    String first_name;
    String last_name;
    String password;
    String email;
    UUID profilePic;

    public void LogedIn() {

    }

    public void LoggedIn(UUID PP) {
        this.profilePic = PP;
    }

    public void setUsername(String name) {
        this.Username = name;

    }

    public String getUsername() {
        return Username;
    }

    public void setLogedin() {
        logedin = true;
    }

    public void setLogedout() {
        logedin = false;
    }

    public void setLoginState(boolean logedin) {
        this.logedin = logedin;
    }

    public boolean getlogedin() {
        return logedin;
    }

    public void setfirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getfirst_name() {
        return first_name;
    }

    public void setlast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getlast_name() {
        return last_name;
    }

    public void setpassword(String password) {
        this.password = password;
    }

    public String getpassword() {
        return password;

    }

    public void setemail(String email) {
        this.email = email;
    }

    public String getemail() {
        return email;
    }

    public UUID getProfilePic() {
        return this.profilePic;
    }
}
