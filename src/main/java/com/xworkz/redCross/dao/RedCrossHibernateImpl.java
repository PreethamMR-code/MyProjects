package com.xworkz.redCross.dao;

import com.xworkz.redCross.dto.DonarAccountDto;
import com.xworkz.redCross.entity.RedCrossEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.util.Optional;

@Repository
public class RedCrossHibernateImpl implements RedCrossDao {

    @Autowired
    EntityManagerFactory entityManagerFactory;


    @Override
    public boolean save(RedCrossEntity redCrossEntity) {

        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(redCrossEntity);
        entityManager.getTransaction().commit();
        return true;

    }

    @Override
    public Optional<RedCrossEntity> getDonarByEmail(String email) {

        System.out.println("dao" + email);
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        RedCrossEntity entity =entityManager.find(RedCrossEntity.class,email);
//        RedCrossEntity entity = (RedCrossEntity) entityManager.createQuery("select entity from RedCrossEntity entity where entity.email=:email").setParameter("email", email).getSingleResult();

        System.out.println(entity);

        return Optional.of(entity);
    }

    @Override
    public boolean update(DonarAccountDto donarAccountDto) {
        return false;
    }

//    @Override
//    public boolean deleteByEmail(int id) {
//
//        boolean isDonarDeleted = false;
//
//        Session session = new Configuration().
//                configure().
//                addAnnotatedClass(DonarAccountDto.class).
//                buildSessionFactory().
//                openSession();
//
//        Transaction transaction = session.beginTransaction();
//        DonarAccountDto donarAccountDto = session.get(DonarAccountDto.class, id);
//
//        if (donarAccountDto != null) {
//            session.save(donarAccountDto);
//            transaction.commit();
//            isDonarDeleted = true;
//        }
//        return true;


    @Override
    public boolean deleteById(int id) {

        boolean isDonorDeleted = false;

        Session session = new Configuration()
                .configure()
                .addAnnotatedClass(DonarAccountDto.class)
                .buildSessionFactory()
                .openSession();

        Transaction transaction = session.beginTransaction();

        // fetch donor using PRIMARY KEY (id)
        DonarAccountDto donarAccountDto = session.get(DonarAccountDto.class, id);

        if (donarAccountDto != null) {

            // DELETE (not save)
            session.delete(donarAccountDto);

            transaction.commit();
            isDonorDeleted = true;
        } else {
            transaction.rollback();
        }

        session.close();
        return isDonorDeleted;
    }

}


