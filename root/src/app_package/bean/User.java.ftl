package ${packageName}.bean;

import com.mai.annotate.Column;
import com.mai.annotate.Id;
import com.mai.annotate.Table;

/**
 * Created by mai on 17/4/17.
 */
@Table
public class User {
    @Id
    private String uid;
    @Column
    private String phone;
    @Column
    private String username;
    @Column
    private String headUrl;
    @Column
    private String password;
    @Column
    private String token;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", phone='" + phone + '\'' +
                ", username='" + username + '\'' +
                ", headUrl='" + headUrl + '\'' +
                ", password='" + password + '\'' +
                ", token='" + token + '\'' +
                '}';
    }
}