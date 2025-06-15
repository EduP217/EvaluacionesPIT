package com.cibertec.utils;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryProvider {

	private static final SqlSessionFactory sqlMapper;

    static {
        try {
            Reader r = Resources.getResourceAsReader("ConfiguracionIbatis.xml");
            sqlMapper = new SqlSessionFactoryBuilder().build(r);
        } catch (IOException e) {
            throw new RuntimeException("Error cargando ConfiguracionIbatis.xml", e);
        }
    }

    public static SqlSessionFactory getSqlSessionFactory() {
        return sqlMapper;
    }
}
