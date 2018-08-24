create table if not exists 'manager' (
    'id' int(11) NOT NULL AUTO_INCREMENT,
    'username' varchar(30) NOT NULL,
    'password' varchar(150) NOT NULL,
    'email' varchar(30),
    'nick_name' varchar(10),
    'avator' varchar(255) DEFAULT NULL,
    'last_login' datetime(6) DEFAULT NULL,
    'date_joined' datetime(6) NOT NULL,
    PRIMARY KEY('id'),
    CONSTRAINT 'ue_ManagerID' UNIQUE(username,email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists 'groups' (
    'id' int(11) NOT NULL AUTO_INCREMENT,
    'name' varchar(20) NOT NULL,
    PRIMARY KEY ('id'),
    UNIQUE KEY 'name'('name')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table if not exists 'manager_groups' (
    'id' int(11) NOT NULL AUTO_INCREMENT,
    'manager_id' int(11) NOT NULL,
    'group_id' int(11) NOT NULL,
    PRIMARY KEY('id'),
    CONSTRAINT 'ue_ManagerID' UNIQUE ('manager_id','group_id')
    CONSTRAINT 'manager_fk' FOREIGN KEY ('manager_id') REFERENCES 'manager' ('id'),
    CONSTRAINT 'group_fk' FOREIGN KEY ('group_id') REFERENCES 'groups' ('id'),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table if not exists 'content_module'(
    'id' int(11) NOT NULL AUTO_INCREMENT,
    'module_name' varchar(20) NOT NULL,
    'module' varchar(20) NOT NULL,
    
    PRIMARY KEY ('id'),
    UNIQUE KEY 'model_unique' ('module_name','module')
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

create table if not exists 'permission'(
    'id' int(11) NOT NULL AUTO_INCREMENT,
    'name' varchar(70) NOT NULL,
    'code_name' varchar(20) NOT NULL,
    'content_module_id' int(11) NOT NULL,
    
    PRIMARY KEY ('id'),
    UNIQUE KEY 'code_name_unique' ('content_module_id','code_name'),
    CONSTRAINT 'content_module_fk' FOREIGN KEY ('content_module_id') REFERENCES 'content_module'('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists 'manager_permission' (
    'id' int(11) NOT NULL AUTO_INCREMENT,
    'manager_id' int(11) NOT NULL,
    'permission_id' int(11) NOT NULL,
    
    PRIMARY KEY ('id'),
    UNIQUE KEY 'pk_unique' ('manager_id','permission_id'),
    KEY 'permission_index' ('permission_id'),
    CONSTRAINT 'permission_fk' FOREIGN KEY ('permission_id') REFERENCES 'permission' ('id'),
    CONSTRAINT 'manager_fk' FOREIGN KEY ('manager_id') REFERENCES 'manager' ('id')
) ENGINNE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists 'groups_permission' (
    'id' int(11) NOT NULL AUTO_INCREMENT,
    'group_id' int(11) NOT NULL,
    'permission_id' int(11) NOT NULL,
    
    PRIMARY KEY ('id'),
    KEY 'permission_index' ('permission_id'),
    CONSTRAINT 'permission_fk' FOREIGN KEY ('permission_id') REFERENCES 'permission' ('id'),
    CONSTRAINT 'group_fk' FOREIGN KEY ('group_id') REFERENCES 'groups' ('id'),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;