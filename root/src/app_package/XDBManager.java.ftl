package ${packageName};

import ${packageName}.bean.User;
import com.mai.annotate.DataBase;
import com.mai.xgreendao.base.DBManager;

import de.greenrobot.dao.AbstractDao;

/**
 * Created by mai on 16/10/17.
 */
@DataBase(name = "template", version = 5)
public class XDBManager extends DBManager {

    public static AbstractDao<User, String> getUserDao() {
        return getDao(User.class);
    }

}
