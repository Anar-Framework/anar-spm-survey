package af.gov.anar.spm.sample.repository;

import af.gov.anar.spm.sample.model.SampleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SampleEntityRepository extends JpaRepository<SampleEntity, Long> {
}
