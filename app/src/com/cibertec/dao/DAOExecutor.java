package com.cibertec.dao;

import java.util.function.Consumer;
import java.util.function.Function;

import org.apache.ibatis.session.SqlSession;

import com.cibertec.utils.SqlSessionFactoryProvider;

public class DAOExecutor {

	 public static <T> T retrieve(Function<SqlSession, T> function) {
        SqlSession session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
        try {
            T result = function.apply(session);
            session.commit();
            return result;
        } catch (Exception e) {
            session.rollback();
            throw new RuntimeException("Error en ejecución MyBatis", e);
        } finally {
            session.close();
        }
    }

    public static void execute(Consumer<SqlSession> consumer) {
        SqlSession session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
        try {
            consumer.accept(session);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw new RuntimeException("Error en ejecución MyBatis", e);
        } finally {
            session.close();
        }
    }
}
