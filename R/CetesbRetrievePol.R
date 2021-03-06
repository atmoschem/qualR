#' Download criteria pollutants from CETESB QUALAR
#'
#' This function download the criteria pollutants from one air quality station (AQS)
#' of CETESB AQS network. It will pad out the date with missing data with NA.
#'
#' @param username User name of CETESB QUALAR
#' @param password User name's password of CETESB QUALAR
#' @param aqs_code Code of AQS
#' @param start_date Date to start downloading in %dd/%mm/%yyyy
#' @param end_date  Date to end downloading in %dd/%mm/%yyyy
#'
#' @return data.frame wth O3, NO, NO2, PM2.5, PM10 and CO information.
#' Units are ug/m3 except for CO which is in ppm.
#' @export
#'
#' @examples
#' \dontrun{
#' # Downloading criteria pollutants from Pinheiros AQS
#' # from January first to 7th of 2020
#' my_user_name <- "John Doe"
#' my_pass_word <- "drowssap"
#' pin_code <- 99 # Check with cetesb_aqs
#' start_date <- "01/01/2020"
#' end_date <- "07/01/2020"
#'
#' pin_pol <- CetesbRetrieve(my_user_name, my_pass_word, pin_code, start_date, end_date)
#'
#' }
CetesbRetrievePol <- function(username, password,
                              aqs_code, start_date,
                              end_date){
  o3 <- CetesbRetrieve(username, password, 63,
                       aqs_code, start_date,
                       end_date)

  no <- CetesbRetrieve(username, password, 17,
                       aqs_code, start_date,
                       end_date)

  no2 <- CetesbRetrieve(username, password, 15,
                        aqs_code, start_date,
                        end_date)


  pm25 <- CetesbRetrieve(username, password, 57,
                         aqs_code, start_date,
                         end_date)


  pm10 <- CetesbRetrieve(username, password, 12,
                         aqs_code, start_date,
                         end_date)


  co <- CetesbRetrieve(username, password, 16,
                       aqs_code, start_date,
                       end_date)


  all_pol <- data.frame(date = o3$date,
                        o3 = o3$pol,
                        no = no$pol,
                        no2 = no2$pol,
                        co = co$pol,
                        pm10 = pm10$pol,
                        pm25 = pm25$pol,
                        aqs = o3$aqs,
                        stringsAsFactors = F)
  print(paste(
    "Download complete for", unique(all_pol$aqs)
  ))


  return(all_pol)
}
