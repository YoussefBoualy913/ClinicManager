package clinicmanager.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DatabaseTest {

    public static void main(String[] args) {

        EntityManagerFactory emf = null;
        EntityManager em = null;

        try {
            emf = Persistence.createEntityManagerFactory("ClinicManagerPU");

            em = emf.createEntityManager();

            Object result = em.createNativeQuery("SELECT 1").getSingleResult();

            System.out.println("Connexion PostgreSQL réussie !");
            System.out.println("Résultat DB : " + result);

        } catch (Exception e) {

            System.out.println("Connexion PostgreSQL échouée !");
            e.printStackTrace();

        } finally {

            if (em != null) {
                em.close();
            }

            if (emf != null) {
                emf.close();
            }
        }
    }
}
