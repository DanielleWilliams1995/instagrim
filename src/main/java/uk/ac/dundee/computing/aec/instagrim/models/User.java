/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Set;
import java.util.TreeSet;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author Administrator
 */
public class User {

    String username;

    Cluster cluster;

    public User() {

    }

    public boolean RegisterUser(String username, String Password, String first_name, String last_name, String email) {
        AeSimpleSHA1 sha1handler = new AeSimpleSHA1();
        String EncodedPassword = null;
        try {
            EncodedPassword = sha1handler.SHA1(Password);
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException et) {
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("insert into userprofiles (login, password, first_name, last_name, email) Values(?,?,?,?,?)");

        BoundStatement boundStatement = new BoundStatement(ps);

        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username, EncodedPassword, first_name, last_name, email));
        //We are assuming this always works.  Also a transaction would be good here !

        return true;
    }

    public boolean updateDetails(String username, String Password, String first_name, String last_name, String email) {
        Session session = cluster.connect("instagrim");

        AeSimpleSHA1 sha1handler = new AeSimpleSHA1();
        String EncodedPassword = null;
        try {
            EncodedPassword = sha1handler.SHA1(Password);
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException et) {
            System.out.println("Can't check your password");
            return false;
        }

        PreparedStatement ps = session.prepare("UPDATE userprofiles SET first_name=?, last_name=?, password=?, email=? WHERE login=?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        first_name, last_name, username, EncodedPassword, email));
        return true;
    }

    public boolean IsValidUser(String username, String Password) {
        AeSimpleSHA1 sha1handler = new AeSimpleSHA1();
        String EncodedPassword = null;
        try {
            EncodedPassword = sha1handler.SHA1(Password);
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException et) {
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {

                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0) {
                    return true;
                }
            }
        }
        return false;
    }

    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    public String displayPassword(String username) {
        String StoredPass = null;

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles WHERE login = ?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));

        if (rs.isExhausted()) {
            System.out.println("No Images returned");

        } else {
            for (Row row : rs) {

                StoredPass = row.getString("password");
                if (StoredPass.compareTo(username) == 0) {
                    return StoredPass;
                }
            }
        }
        return StoredPass;
    }

    public String displayemail(String username) {

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select email from userprofiles WHERE login = ?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));

        String StoredPass = "";
        if (rs.isExhausted()) {
            System.out.println("No Images returned");

        } else {
            for (Row row : rs) {

                StoredPass = row.getString("email");
            }
        }
        return StoredPass;
    }

    public String displayfirst_name(String username) {

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select first_name from userprofiles WHERE login = ?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));

        String StoredPass = "";
        if (rs.isExhausted()) {
            System.out.println("No Images returned");

        } else {
            for (Row row : rs) {

                StoredPass = row.getString("first_name");
            }
        }
        return StoredPass;
    }

    public String displaylast_name(String username) {

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select last_name from userprofiles WHERE login = ?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        String StoredPass = "";
        if (rs.isExhausted()) {
            System.out.println("No Images returned");

        } else {
            for (Row row : rs) {

                StoredPass = row.getString("last_name");
            }
        }
        return StoredPass;
    }

    public UUID getProfilePicture(String username) {
        UUID toReturn = new UUID(0, 0);

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select profilePic from userprofiles WHERE login=?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Image found");
            return null;
        } else {
            for (Row row : rs) {
                toReturn = row.getUUID("profilePic");
                break;
            }
        }

        return toReturn;
    }

    public User(String username) {
        this.username = username;

    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void delete() {
        Session session = cluster.connect("instagrim");

        //Delete user
        PreparedStatement ps = session.prepare("DELETE FROM userprofiles WHERE login = ?;");
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute(boundStatement.bind(this.username));

    }

    public void deletePic() {
        Session session = cluster.connect("instagrim");

        PreparedStatement ps = session.prepare("SELECT picid FROM userpiclist WHERE user = ?;");
        BoundStatement boundStatement = new BoundStatement(ps);
        ResultSet result = session.execute(boundStatement.bind(this.username));

        if (result.isExhausted() == false) {
            for (Row row : result) {
                ps = session.prepare("DELETE FROM pics WHERE picid = ?");
                boundStatement = new BoundStatement(ps);
                session.execute(boundStatement.bind(row.getUUID("picid")));
            }
        }
        ps = session.prepare("DELETE FROM userpiclist WHERE user = ?");
        boundStatement = new BoundStatement(ps);
        session.execute(boundStatement.bind(this.username));
    }

    public static boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null) {
            return lg.getlogedin();
        }

        return false;
    }

}
