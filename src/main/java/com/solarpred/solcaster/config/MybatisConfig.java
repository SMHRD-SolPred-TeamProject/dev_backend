package com.solarpred.solcaster.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration //설정파일
@EnableTransactionManagement   //트랜잭션 관리
@MapperScan(basePackages = "com.solarpred.solcaster.mapper")
public class MybatisConfig {

    @Bean
    public DataSource batisDataSource() {
        HikariConfig dataSourceConfig = new HikariConfig();
        dataSourceConfig.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSourceConfig.setJdbcUrl("jdbc:mysql://project-db-stu.ddns.net:3307/wish");
        dataSourceConfig.setUsername("wish");
        dataSourceConfig.setPassword("1234");
        dataSourceConfig.setMaximumPoolSize(10);
        dataSourceConfig.setMinimumIdle(5);
        dataSourceConfig.setMaxLifetime(1200000);
        dataSourceConfig.setConnectionTimeout(20000);
        dataSourceConfig.setIdleTimeout(300000);

        return new HikariDataSource(dataSourceConfig);
    }

    //데이터베이스와의 연결과 SQL의 실행에 대한 모든 것을 가진 가장 중요한 객체
    @Bean(name= "batisSqlSessionFactory")
    public SqlSessionFactory batisSqlSessionFactory(@Qualifier("batisDataSource") DataSource batisDataSource, ApplicationContext applicationContext) throws Exception {
        SqlSessionFactoryBean sqlSession = new SqlSessionFactoryBean();
        sqlSession.setDataSource(batisDataSource);
        sqlSession.setConfigLocation(applicationContext.getResource("classpath:mybatis-config.xml")); //mybatis-config.xml의 경로
        sqlSession.setMapperLocations(applicationContext.getResources("classpath:/com/solarpred/solcaster/mapper/MemberMapper.xml")); //쿼리문을 관리하는 mapper파일의 경로

        return sqlSession.getObject();

    }

    //마이바티스 스프링 연동모듈의 핵심
    @Bean(name = "batisSqlSessionTemplate")
    public SqlSessionTemplate batisSqlSessionTemplate(SqlSessionFactory batisSqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(batisSqlSessionFactory);
    }


}
