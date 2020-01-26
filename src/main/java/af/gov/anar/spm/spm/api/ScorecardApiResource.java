
package af.gov.anar.spm.spm.api;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import af.gov.anar.spm.spm.data.ScorecardData;
import af.gov.anar.spm.spm.domain.Scorecard;
import af.gov.anar.spm.spm.domain.Survey;
import af.gov.anar.spm.spm.service.ScorecardReadPlatformService;
import af.gov.anar.spm.spm.service.ScorecardService;
import af.gov.anar.spm.spm.service.SpmService;
import af.gov.anar.spm.spm.util.ScorecardMapper;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Path("/surveys/scorecards")
@Component
@Scope("singleton")
@Api(value = "SPM - Scorecards", description = " ")
public class ScorecardApiResource {

    private final SpmService spmService;
    private final ScorecardService scorecardService;
    private final ScorecardReadPlatformService scorecardReadPlatformService;

    @Autowired
    public ScorecardApiResource(final SpmService spmService,
                                final ScorecardService scorecardService,
                                final ScorecardReadPlatformService scorecardReadPlatformService) {
        this.spmService = spmService;
        this.scorecardService = scorecardService;
        this.scorecardReadPlatformService = scorecardReadPlatformService;
    }

    @GET
    @Path("{surveyId}")
    @Consumes({ MediaType.APPLICATION_JSON })
    @Produces({ MediaType.APPLICATION_JSON })
    @Transactional
    @ApiOperation(value = "List all Scorecard entries", notes = "List all Scorecard entries for a survey.")
    @ApiResponses({@ApiResponse(code = 200, message = "", response = Scorecard.class, responseContainer = "list")})
    public List<ScorecardData> findBySurvey(@PathParam("surveyId") @ApiParam(value = "Enter surveyId") final Long surveyId) {
        this.spmService.findById(surveyId);
        return (List<ScorecardData>) this.scorecardReadPlatformService.retrieveScorecardBySurvey(surveyId);
    }

    @POST
    @Path("{surveyId}")
    @Consumes({ MediaType.APPLICATION_JSON })
    @Produces({ MediaType.APPLICATION_JSON })
    @Transactional
    @ApiOperation(value = "Create a Scorecard entry", notes = "Add a new entry to a survey.\n" + "\n" + "Mandatory Fields\n" + "clientId, createdOn, questionId, responseId, staffId")
    @ApiResponses({@ApiResponse(code = 200, message = "OK")})
    public void createScorecard(@PathParam("surveyId") @ApiParam(value = "Enter surveyId") final Long surveyId, @ApiParam(format = "body", type = "body") final ScorecardData scorecardData) {
        final Survey survey = this.spmService.findById(surveyId);
//        final Client client = this.clientRepositoryWrapper.findOneWithNotFoundDetection(scorecardData.getClientId());
//        this.scorecardService.createScorecard(ScorecardMapper.map(scorecardData, survey, appUser, client));
    }

    @GET
    @Path("{surveyId}/clients/{clientId}")
    @Consumes({ MediaType.APPLICATION_JSON })
    @Produces({ MediaType.APPLICATION_JSON })
    @Transactional
    public List<ScorecardData> findBySurveyAndClient(@PathParam("surveyId") @ApiParam(value = "Enter surveyId") final Long surveyId,
                                                  @PathParam("clientId") @ApiParam(value = "Enter clientId") final Long clientId) {
        this.spmService.findById(surveyId);
//        this.clientRepositoryWrapper.findOneWithNotFoundDetection(clientId);
        return (List<ScorecardData>) this.scorecardReadPlatformService.retrieveScorecardBySurveyAndClient(surveyId, clientId);

    }

    @GET
    @Path("clients/{clientId}")
    @Consumes({ MediaType.APPLICATION_JSON })
    @Produces({ MediaType.APPLICATION_JSON })
    @Transactional
    public List<ScorecardData> findByClient(@PathParam("clientId") final Long clientId) {
//        this.clientRepositoryWrapper.findOneWithNotFoundDetection(clientId);
        return (List<ScorecardData>) this.scorecardReadPlatformService.retrieveScorecardByClient(clientId);
    }
}
