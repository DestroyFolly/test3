import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class ServerAtOnceLoadSimulation extends Simulation {

  val httpProtocolEcho = http.baseUrl("http://echo-ping:8080")
  val httpProtocolFastHTTP = http.baseUrl("http://fasthttp-ping:8081")

  val scnEcho = scenario("Echo Server Load Test")
    .exec(http("Echo Metrics").get("/ping"))
  val scnFastHTTP = scenario("FastHTTP Server Load Test")
    .exec(http("FastHTTP Metrics").get("/ping"))

  setUp(
    scnEcho.inject(
      atOnceUsers(2000),
      nothingFor(5.seconds),
      atOnceUsers(8000),
      nothingFor(5.seconds),
      atOnceUsers(15000),
      nothingFor(5.seconds),
      atOnceUsers(25000)
    ).protocols(httpProtocolEcho),

    scnFastHTTP.inject(
      atOnceUsers(2000),
      nothingFor(5.seconds),
      atOnceUsers(8000),
      nothingFor(5.seconds),
      atOnceUsers(15000),
      nothingFor(5.seconds),
      atOnceUsers(25000)
    ).protocols(httpProtocolFastHTTP)
  ).maxDuration(60.seconds)
}
